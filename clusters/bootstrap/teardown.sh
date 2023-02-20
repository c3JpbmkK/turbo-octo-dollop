#!/usr/bin/env bash

helm -n kube-system delete sealed-secrets
helm -n argocd delete argo-cd
helm -n crossplane-system delete crossplane