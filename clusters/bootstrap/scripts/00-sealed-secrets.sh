#!/usr/bin/env bash

# Using namespace kube-system for cluster scoped installation

helm repo add sealed-secrets https://bitnami-labs.github.io/sealed-secrets
helm repo update

helm upgrade sealed-secrets sealed-secrets/sealed-secrets \
                            --install \
                            --create-namespace \
                            --namespace kube-system \
                            --set-string fullnameOverride=sealed-secrets-controller

# # https://github.com/bitnami-labs/sealed-secrets/blob/main/docs/bring-your-own-certificates.md
# echo "Generating a new RSA key pair"
# openssl req -x509 -nodes -newkey rsa:4096 -keyout tls.key -out tls.crt -subj "/CN=sealed-secret/O=sealed-secret" 2>/dev/null
export PUBLIC_KEY="tls.crt"
export PRIVATE_KEY="tls.key"
export CUSTOM_SECRET="custom-sealed-secrets-keys"

if [ -f "$PUBLIC_KEY" ] && [ -f "$PRIVATE_KEY" ] ; then
    echo "Loading existing key pair"
    kubectl -n kube-system create secret tls "$CUSTOM_SECRET" --cert="$PUBLIC_KEY" --key="$PRIVATE_KEY"
    kubectl -n kube-system label secret "$CUSTOM_SECRET" sealedsecrets.bitnami.com/sealed-secrets-key=active
    kubectl -n kube-system delete pods -l app.kubernetes.io/name=sealed-secrets 
    until $(kubectl -n kube-system logs -l app.kubernetes.io/name=sealed-secrets 2>/dev/null | grep -q "$CUSTOM_SECRET") ; do
        sleep 1
        echo "Waiting for key pair to be loaded"
    done
    echo "Existing key pair loaded into sealed-secrets controller"
else 
    echo "No existing key pair found"
fi
