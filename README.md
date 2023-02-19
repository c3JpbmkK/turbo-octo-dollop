# turbo-octo-dollop

```bash
tree --dirsfirst >> README.md
.
├── charts
│   ├── argocd
│   │   ├── Chart.yaml
│   │   └── values.yaml
│   ├── cert-manager
│   │   ├── Chart.yaml
│   │   └── values.yaml
│   ├── crossplane
│   │   ├── Chart.yaml
│   │   └── values.yaml
│   └── ingress-nginx
│       ├── clusters
│       │   ├── in-cluster
│       │   │   └── values.yaml
│       │   ├── tracer
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
│   └── tracer
├── hubs
│   ├── in-cluster
│   │   ├── templates
│   │   │   ├── 00-application-ingress-nginx.yaml
│   │   │   ├── 01-application-cert-manager.yaml
│   │   │   ├── 02-application-argocd.yaml
│   │   │   └── 03-application-crossplane.yaml
│   │   ├── application.yaml
│   │   └── project.yaml
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
├── projects
│   ├── cariad.yaml
│   ├── featsrini.yaml
│   ├── in-cluster.yaml
│   ├── liquid-reply.yaml
│   ├── tracer.yaml
│   └── visual.yaml
├── kill-port-forward.sh
├── nohup.out
├── port-forward.sh
├── README.md
├── setup.sh
└── teardown.sh

26 directories, 39 files
```
