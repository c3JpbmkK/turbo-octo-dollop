#!/usr/bin/env bash

## Create kind cluster
kind create cluster || echo "Something went wrong"

## Install argocd
helm repo add argo https://argoproj.github.io/argo-helm
helm upgrade --install --create-namespace --namespace argocd argo-cd argo/argo-cd

ARGOCD_INITIAL_ADMIN_PASSWORD=$(kubectl  -n argocd get secrets argocd-initial-admin-secret  -o json | jq -r '.data.password' | base64 -d)