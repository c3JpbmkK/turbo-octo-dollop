#!/usr/bin/env bash

HOST_USER=srini

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
ARGOCD_INITIAL_ADMIN_SECRET=$(kubectl -n argocd get secrets argocd-initial-admin-secret -o json 2>/dev/null \
                            | jq -r '.data.password' \
                            | base64 -d \
                            || writeError)
echo "Waiting for argocd"
sleep 10
done
argocd login --username admin --password "$ARGOCD_INITIAL_ADMIN_SECRET" 2>/dev/null || writeError

## List current cluster in local argocd intance
argocd cluster list 2>/dev/null || writeError

## Add multiple clusters to local argocd instance
echo "Adding cluster tracer-admin"
argocd cluster add --yes --kubeconfig /home/"${HOST_USER}"/.kube/config --name "tracer" "tracer-admin" 2>/dev/null

echo "Adding cluster visual-admin"
argocd cluster add --yes --kubeconfig /home/"${HOST_USER}"/.kube/config --name "visual" "visual-admin" 2>/dev/null
