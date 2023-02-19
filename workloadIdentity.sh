#!/usr/bin/env bash

# Register the provider specific feature
az feature register --name EnableWorkloadIdentityPreview --namespace Microsoft.ContainerService

# Wait for the feature to complete registration
Status=$(az feature show --name EnableWorkloadIdentityPreview  --namespace microsoft.ContainerService --query properties.state --output tsv)
while [ "$Status" != "Registered" ] ; do
    echo "Waiting for feature \"EnableWorkloadIdentityPreview\" registration to complete" && sleep 30
    Status=$(az feature show --name EnableWorkloadIdentityPreview  --namespace microsoft.ContainerService --query properties.state --output tsv)
done
echo "Feature \"EnableWorkloadIdentityPreview\" registered"

# Reload the provider namespace registration
az provider register -n Microsoft.ContainerService

# Enable OIDC and Workload Identity on a cluster
read -p "Enter subscription name: " SUBSCRIPTION
read -p "Enter cluster name: " CLUSTER_NAME
read -p "Enter cluster resource group: " RESOURCE_GROUP

read -p "Enable OIDC Issuer and Workload Identity (y|n): " CONFIRM

case $CONFIRM in
    y|Y)
        echo "Enabling OIDC Issuer and Workload Identity in ${CLUSTER_NAME}"
        az extension add --name aks-preview
        az aks update --subscription "$SUBSCRIPTION" --resource-group "$RESOURCE_GROUP" --name "$CLUSTER_NAME" --enable-oidc-issuer --enable-workload-identity true
        ;;
    n|N) 
        echo "Skipping ${CLUSTER_NAME}"
        ;;
    *)
        echo "$CONFIRM"
esac
 