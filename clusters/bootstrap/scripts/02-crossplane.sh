#!/usr/bin/env bash

set -euo pipefail

helm repo add crossplane-stable https://charts.crossplane.io/stable
helm repo update

helm upgrade crossplane crossplane-stable/crossplane \
                        --install \
                        --namespace crossplane-system \
                        --create-namespace

# Deploy azure provider
## https://marketplace.upbound.io/providers/upbound/provider-azure/v0.27.0
until kubectl get crds providers.pkg.crossplane.io &>/dev/null ; do
  sleep 5
  echo "Waiting for Providers CRD to become available"
done
echo "Providers CRD ready"

function installPackage {
  PROVIDER_NAME=$1
  PROVIDER_URL=$2
  PROVIDER_VERSION=$3

  echo "Creating ${PROVIDER_NAME} from package ${PROVIDER_URL}"
  cat <<EOF | kubectl apply -f -
apiVersion: pkg.crossplane.io/v1
kind: Provider
metadata:
  name: ${PROVIDER_NAME}
spec:
  package: ${PROVIDER_URL}:${PROVIDER_VERSION}
EOF

  # Wait for provier to become available
  set +e
  Provider=$(kubectl get provider.pkg "${PROVIDER_NAME}" -o json 2>/dev/null | jq -er 'select(.status.conditions[]|(.type=="Healthy") and (.status=="True")).metadata.name' 2>/dev/null)
  while [ -z "$Provider" ] ; do
      echo "Waiting for ${PROVIDER_NAME} to become healthy"
      sleep 5
      Provider=$(kubectl get provider.pkg "${PROVIDER_NAME}" -o json 2>/dev/null | jq -er 'select(.status.conditions[]|(.type=="Healthy") and (.status=="True")).metadata.name' 2>/dev/null)
  done
  set -e
}

echo "Installing required packages"
installPackage "provider-azure" "xpkg.upbound.io/upbound/provider-azure" "v0.28.0"
installPackage "provider-azuread" "xpkg.upbound.io/upbound/provider-azuread" "v0.4.0"
installPackage "provider-argocd" "xpkg.upbound.io/crossplane-contrib/provider-argocd" "v0.2.0"
installPackage "provider-helm" "xpkg.upbound.io/crossplane-contrib/provider-helm" "v0.13.0"
installPackage "provider-kubernetes" "xpkg.upbound.io/crossplane-contrib/provider-kubernetes" "v0.6.0"

echo "Installing supplied crdentials"
kubectl apply -f credentials/