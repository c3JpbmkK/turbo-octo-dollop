#!/usr/bin/env bash

## Delete argoproj CRDs
kubectl  delete crds -l app.kubernetes.io/part-of=argocd || echo "Error"
## Delete kind cluster
kind delete cluster || echo "Error"
