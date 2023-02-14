#!/usr/bin/env bash

## Utilities
function writeError {
    echo "Something went wrong"
}

## Delete argoproj CRDs
kubectl  delete crds -l app.kubernetes.io/part-of=argocd || writeError
## Delete kind cluster
kind delete cluster || writeError
