#!/usr/bin/env bash

# Add required repositories
helm repo add argo https://argoproj.github.io/argo-helm
helm repo add crossplane-stable https://charts.crossplane.io/stable
helm repo add sealed-secrets https://bitnami-labs.github.io/sealed-secrets

# Update repositories
helm repo update

# Install sealed-secrets
helm upgrade sealed-secrets sealed-secrets/sealed-secrets \
                            --install \
                            --create-namespace \
                            --namespace kube-system \
                            --set-string fullnameOverride=sealed-secrets-controller


# Install argo-cd
helm upgrade argo-cd argo/argo-cd \
                            --install \
                            --create-namespace \
                            --namespace argocd \

# Install crossplane
helm upgrade crossplane crossplane-stable/crossplane \
                            --install \
                            --namespace crossplane-system \
                            --create-namespace  

# todo: configure sealed-secrets to be able to unseal sealed-secrets

# Deploy azure provider
## https://marketplace.upbound.io/providers/upbound/provider-azure/v0.27.0
kubectl apply -f provider/provider.yaml

# Wait for provier to become available
Provider=$(kubectl get provider upbound-provider-azure -o json | jq -r 'select(.status.conditions[]|(.type=="Healthy") and (.status=="True")).metadata.name')
while [ -z "$Provider" ] ; do
    echo "Waiting for provider to become healthy"
    sleep 5
    Provider=$(kubectl get provider upbound-provider-azure -o json | jq -r 'select(.status.conditions[]|(.type=="Healthy") and (.status=="True")).metadata.name')
done

