#!/usr/bin/env bash

set -euo pipefail

helm repo add argo https://argoproj.github.io/argo-helm
helm repo update

helm upgrade argo-cd argo/argo-cd \
                    --install \
                    --create-namespace \
                    --namespace argocd \
