# turbo-octo-dollop

```bash
tree --dirsfirst >> README.md
.
├── charts
│   ├── aks
│   │   ├── clusters
│   │   │   └── westeurope-cluster-00
│   │   │       └── values.yaml
│   │   ├── templates
│   │   │   ├── dnsZone.yaml
│   │   │   ├── managedCluster.yaml
│   │   │   ├── nodePools.yaml
│   │   │   ├── providerConfig.yaml
│   │   │   ├── resourceGroup.yaml
│   │   │   └── userAssignedManagedIdentity.yaml
│   │   ├── Chart.yaml
│   │   └── values.yaml
│   ├── argo-cd
│   │   ├── clusters
│   │   │   └── visual
│   │   │       └── values.yaml
│   │   ├── templates
│   │   ├── Chart.yaml
│   │   └── values.yaml
│   ├── cert-manager
│   │   ├── clusters
│   │   │   └── visual
│   │   │       └── values.yaml
│   │   ├── templates
│   │   │   └── http01-clusterissuer.yaml
│   │   ├── Chart.yaml
│   │   └── values.yaml
│   ├── crossplane
│   │   ├── clusters
│   │   │   └── visual
│   │   │       └── values.yaml
│   │   ├── Chart.yaml
│   │   └── values.yaml
│   └── ingress-nginx
│       ├── clusters
│       │   ├── in-cluster
│       │   │   └── values.yaml
│       │   └── visual
│       │       └── values.yaml
│       ├── templates
│       │   ├── dns-job.yaml
│       │   ├── dns-rolebinding.yaml
│       │   ├── dns-role.yaml
│       │   └── dns-serviceaccount.yaml
│       ├── Chart.yaml
│       └── values.yaml
├── clusters
│   ├── bootstrap
│   │   ├── clusters
│   │   │   └── westeurope-cluster-00.yaml
│   │   ├── provider
│   │   │   ├── azure-provider-config.yaml
│   │   │   └── provider.yaml
│   │   ├── install.sh
│   │   ├── README.md
│   │   └── teardown.sh
│   └── visual
│       ├── templates
│       │   ├── 00-application-ingress-nginx.yaml
│       │   ├── 01-application-cert-manager.yaml
│       │   ├── 02-application-argocd.yaml
│       │   └── 03-application-crossplane.yaml
│       ├── application.yaml
│       └── project.yaml
├── hooks
│   ├── pre-commit
│   └── README.md
├── manifests
│   ├── base
│   └── overlays
│       ├── dev
│       ├── int
│       ├── prod
│       └── test
├── kill-port-forward.sh
├── nohup.out
├── port-forward.sh
├── README.md
├── setup.sh
├── teardown.sh
└── workloadIdentity.sh

36 directories, 48 files
```

---

## todos

```bash
clusters/bootstrap/install.sh:# todo: configure sealed-secrets to be able to unseal sealed-secrets
hooks/pre-commit:git grep "todo:" >> README.md
```

---

## chores

```bash
charts/aks/templates/resourceGroup.yaml:  # chore: scope it to a namespace
charts/ingress-nginx/templates/dns-job.yaml:            az account set -s "$DNS_ZONE_SUBSCRIPTION" # chore: remove this line if design is accepted
clusters/bootstrap/README.md:## chore: find out about `--set-string fullnameOverride=sealed-secrets-controller`
clusters/bootstrap/README.md:## chore: Advanced management of sealed-secrets sealing key secret
clusters/visual/templates/01-application-cert-manager.yaml:    # chore: identify if we can exactly ignore the following instead of everything under webhooks
hooks/pre-commit:git grep "chore:" >> README.md
```

