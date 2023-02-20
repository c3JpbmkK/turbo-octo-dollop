#!/usr/bin/env bash

ADMIN_PASSWORD=$(kubectl get secrets argocd-initial-admin-secret -o json | jq -r '.data.password' | base64 -d)

echo "Admin password is ${ADMIN_PASSWORD}"
echo "Starting port-forward in background"
nohup kubectl port-forward svc/bootstrap-argocd-server 8080:80 2>/dev/null &

