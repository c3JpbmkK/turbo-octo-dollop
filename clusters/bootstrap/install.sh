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
                            --namespace argo/argo-cd \
                            --set-string fullnameOverride=sealed-secrets-controller

# Install crossplane
helm upgrade crossplane crossplane-stable/crossplane \
                            --install \
                            --namespace crossplane-system \
                            --create-namespace  

