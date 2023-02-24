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
│   │   │   ├── dnsZoneUpdate-job.yaml.txt
│   │   │   ├── dnsZone.yaml
│   │   │   ├── managedCluster.yaml
│   │   │   ├── nodePools.yaml
│   │   │   ├── providerConfig.yaml
│   │   │   ├── resourceGroup.yaml
│   │   │   ├── subnets.yaml
│   │   │   ├── userAssignedManagedIdentity.yaml
│   │   │   └── virtual-network.yaml
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

36 directories, 51 files
```

---

## todos

File name | Line number | Todo
---|---|---|
[clusters/bootstrap/install.sh](clusters/bootstrap/install.sh)|31| configure sealed-secrets to be able to unseal sealed-secrets|
[clusters/bootstrap/install.sh](clusters/bootstrap/install.sh)|35| remove relative path to YAML file or use absolute path from root of repo|

---

## chores

File name | Line number | Chore
---|---|---|
[charts/aks/templates/dnsZoneUpdate-job.yaml.txt](charts/aks/templates/dnsZoneUpdate-job.yaml.txt)|56| remove this line if design is accepted|
[charts/aks/templates/resourceGroup.yaml](charts/aks/templates/resourceGroup.yaml)|5| scope it to a namespace|
[charts/ingress-nginx/templates/dns-job.yaml](charts/ingress-nginx/templates/dns-job.yaml)|56| remove this line if design is accepted|
[clusters/bootstrap/README.md](clusters/bootstrap/README.md)|5| find out about `--set-string fullnameOverride=sealed-secrets-controller`|
[clusters/bootstrap/README.md](clusters/bootstrap/README.md)|7| Advanced management of sealed-secrets sealing key secret|

