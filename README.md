# turbo-octo-dollop

```bash
tree --dirsfirst >> README.md
.
├── charts
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
│   │   ├── install.sh
│   │   └── README.md
│   └── visual
│       ├── templates
│       │   ├── 00-application-ingress-nginx.yaml
│       │   ├── 01-application-cert-manager.yaml
│       │   ├── 02-application-argocd.yaml
│       │   └── 03-application-crossplane.yaml
│       ├── application.yaml
│       └── project.yaml
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

30 directories, 33 files
```
