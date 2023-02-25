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
│   │   │   ├── cluster.yaml
│   │   │   ├── dnsARecord.yaml
│   │   │   ├── dnsZoneUpdate-job.yaml.txt
│   │   │   ├── dnsZone.yaml
│   │   │   ├── kubernetesClusterNodePool.yaml
│   │   │   ├── kubernetesCluster.yaml
│   │   │   ├── provider.yaml
│   │   │   ├── publicIP.yaml
│   │   │   ├── resourceGroup.yaml
│   │   │   ├── subnets.yaml
│   │   │   ├── userAssignedManagedIdentity.yaml
│   │   │   └── virtual-network.yaml
│   │   ├── Chart.yaml
│   │   └── values.yaml
│   ├── argo-cd
│   │   ├── clusters
│   │   │   └── westeurope-cluster-00
│   │   │       └── values.yaml
│   │   └── values.yaml
│   ├── cert-manager
│   │   ├── clusters
│   │   │   └── westeurope-cluster-00
│   │   │       └── values.yaml
│   │   └── values.yaml
│   ├── crossplane
│   │   ├── clusters
│   │   │   └── westeurope-cluster-00
│   │   │       └── values.yaml
│   │   └── values.yaml
│   └── ingress-nginx
│       ├── clusters
│       │   └── westeurope-cluster-00
│       │       └── values.yaml
│       └── values.yaml
├── clusters
│   ├── bootstrap
│   │   ├── apps
│   │   │   └── westeurope-cluster-00.yaml
│   │   ├── credentials
│   │   │   ├── azure-providerconfig.yaml
│   │   │   └── providerConfig.yaml
│   │   ├── infra
│   │   │   └── westeurope-cluster-00.yaml
│   │   ├── scripts
│   │   │   ├── 00-sealed-secrets.sh
│   │   │   ├── 01-argo-cd.sh
│   │   │   └── 02-crossplane.sh
│   │   ├── install.sh
│   │   ├── README.md
│   │   ├── teardown.sh
│   │   ├── tls.crt
│   │   └── tls.key
│   └── westeurope-cluster-00
│       ├── apps
│       └── infra
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

35 directories, 44 files
```

---

## todos

File name | Line number | Todo
---|---|---|

---

## chores

File name | Line number | Chore
---|---|---|
[charts/aks/templates/dnsZoneUpdate-job.yaml.txt](charts/aks/templates/dnsZoneUpdate-job.yaml.txt)|56| remove this line if design is accepted|
[clusters/bootstrap/README.md](clusters/bootstrap/README.md)|5| find out about `--set-string fullnameOverride=sealed-secrets-controller`|
[clusters/bootstrap/README.md](clusters/bootstrap/README.md)|7| Advanced management of sealed-secrets sealing key secret|

