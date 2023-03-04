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
│   │   ├── templates
│   │   ├── Chart.yaml
│   │   └── values.yaml
│   ├── cert-manager
│   │   ├── clusters
│   │   │   └── westeurope-cluster-00
│   │   │       └── values.yaml
│   │   ├── templates
│   │   │   └── http01-clusterissuer.yaml
│   │   ├── Chart.yaml
│   │   └── values.yaml
│   ├── crossplane
│   │   ├── clusters
│   │   │   └── westeurope-cluster-00
│   │   │       └── values.yaml
│   │   ├── templates
│   │   ├── Chart.yaml
│   │   └── values.yaml
│   ├── ingress-haproxy
│   │   ├── clusters
│   │   │   └── westeurope-cluster-00
│   │   │       └── values.yaml
│   │   ├── templates
│   │   ├── Chart.yaml
│   │   └── values.yaml
│   ├── ingress-nginx
│   │   ├── clusters
│   │   │   └── westeurope-cluster-00
│   │   │       └── values.yaml
│   │   ├── templates
│   │   │   ├── patch-svc-job.yaml
│   │   │   ├── patch-svc-roleBinding.yaml
│   │   │   ├── patch-svc-role.yaml
│   │   │   └── patch-svc-serviceAccount.yaml
│   │   ├── Chart.yaml
│   │   └── values.yaml
│   ├── jaeger
│   │   ├── clusters
│   │   │   └── westeurope-cluster-00
│   │   │       └── values.yaml
│   │   ├── templates
│   │   ├── Chart.yaml
│   │   └── values.yaml
│   └── oauth-proxy
│       ├── clusters
│       │   └── westeurope-cluster-00
│       │       └── values.yaml
│       ├── templates
│       ├── Chart.yaml
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

51 directories, 61 files
```

---

## todos

File name | Line number | Todo
---|---|---|
[charts/aks/clusters/westeurope-cluster-00/values.yaml](charts/aks/clusters/westeurope-cluster-00/values.yaml)|13| peer two vnets|

---

## chores

File name | Line number | Chore
---|---|---|
[charts/aks/clusters/westeurope-cluster-00/values.yaml](charts/aks/clusters/westeurope-cluster-00/values.yaml)|14| identify how to connect to vnets, either using single provider config or two|
[clusters/bootstrap/README.md](clusters/bootstrap/README.md)|5| find out about `--set-string fullnameOverride=sealed-secrets-controller`|
[clusters/bootstrap/README.md](clusters/bootstrap/README.md)|7| Advanced management of sealed-secrets sealing key secret|
[clusters/bootstrap/apps/westeurope-cluster-00.yaml](clusters/bootstrap/apps/westeurope-cluster-00.yaml)|14| change to true after development|

