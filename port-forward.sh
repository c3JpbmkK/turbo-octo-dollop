#!/usr/bin/env bash

ADMIN_PASSWORD=$(kubectl -n argocd get secrets argocd-initial-admin-secret -o json | jq -r '.data.password' | base64 -d)

echo "Admin password is ${ADMIN_PASSWORD}"
echo "Starting port-forward in background"
nohup kubectl -n argocd port-forward svc/argo-cd-argocd-server 8080:80 2>/dev/null &
