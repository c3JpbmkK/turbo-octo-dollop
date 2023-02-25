#!/usr/bin/env bash

helm repo add crossplane-stable https://charts.crossplane.io/stable
helm repo update

helm upgrade crossplane crossplane-stable/crossplane \
                        --install \
                        --namespace crossplane-system \
                        --create-namespace

# Deploy azure provider
## https://marketplace.upbound.io/providers/upbound/provider-azure/v0.27.0
PROVIDER_NAME="upbound-provider-azure"
PROVIDER_VERSION="v0.28.0"
PROVIDER_URL="xpkg.upbound.io/upbound/provider-azure"

until kubectl get crds providers.pkg.crossplane.io &>/dev/null ; do
  sleep 5
  echo "Waiting for Providers CRD to become available"
done
echo "Providers CRD ready"

echo "Creating provider from package ${PROVIDER_URL}"
cat <<EOF | kubectl apply -f -
apiVersion: pkg.crossplane.io/v1
kind: Provider
metadata:
  name: ${PROVIDER_NAME}
spec:
  package: ${PROVIDER_URL}:${PROVIDER_VERSION}
EOF

# Wait for provier to become available
Provider=$(kubectl get provider "${PROVIDER_NAME}" -o json 2>/dev/null | jq -er 'select(.status.conditions[]|(.type=="Healthy") and (.status=="True")).metadata.name' 2>/dev/null)
while [ -z "$Provider" ] ; do
    echo "Waiting for provider to become healthy"
    sleep 5
    Provider=$(kubectl get provider "${PROVIDER_NAME}" -o json 2>/dev/null | jq -er 'select(.status.conditions[]|(.type=="Healthy") and (.status=="True")).metadata.name' 2>/dev/null)
done

echo "Installing supplied crdentials"
kubectl apply -f credentials/