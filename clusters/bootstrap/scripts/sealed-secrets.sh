#!/usr/bin/env bash

helm repo add sealed-secrets https://bitnami-labs.github.io/sealed-secrets
helm repo update

helm upgrade sealed-secrets sealed-secrets/sealed-secrets \
                            --install \
                            --create-namespace \
                            --namespace kube-system \
                            --set-string fullnameOverride=sealed-secrets-controller
