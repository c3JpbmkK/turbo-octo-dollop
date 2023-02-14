#!/usr/bin/env bash

## Utilities
function writeError {
    echo "Something went wrong"
}

## Create kind cluster
kind create cluster || writeError

## Install argocd
helm repo add argo https://argoproj.github.io/argo-helm
helm upgrade --install --create-namespace --namespace argocd argo-cd argo/argo-cd

## Login into the argo-cd server
export ARGOCD_OPTS='--port-forward --port-forward-namespace argocd'
while [ -z "$ARGOCD_INITIAL_ADMIN_SECRET" ]
do
ARGOCD_INITIAL_ADMIN_SECRET=$(kubectl -n argocd get secrets argocd-initial-admin-secret  -o json | jq -r '.data.password' | base64 -d || writeError)
sleep 1
done
argocd login --username admin --password "$ARGOCD_INITIAL_ADMIN_SECRET" 2>/dev/null || writeError

## Add cluster to local argocd intance
argocd cluster list 2>/dev/null || writeError
echo "Using context mega-featsrini-kubernetes-admin"
argocd cluster add --yes --kubeconfig /home/srini/.kube/config mega-featsrini-kubernetes-admin 

## Customize local argocd instance
argocd proj create