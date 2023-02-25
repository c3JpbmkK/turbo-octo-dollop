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

cat <<EOF | kubectl apply --dry-run=client -o yaml -f -
apiVersion: pkg.crossplane.io/v1
kind: Provider
metadata:
  name: ${PROVIDER_NAME}
spec:
  package: ${PROVIDER_URL}:${PROVIDER_VERSION}
EOF

# Wait for provier to become available
Provider=$(kubectl get provider upbound-provider-azure -o json | jq -r 'select(.status.conditions[]|(.type=="Healthy") and (.status=="True")).metadata.name')
while [ -z "$Provider" ] ; do
    echo "Waiting for provider to become healthy"
    sleep 5
    Provider=$(kubectl get provider upbound-provider-azure -o json | jq -r 'select(.status.conditions[]|(.type=="Healthy") and (.status=="True")).metadata.name')
done
