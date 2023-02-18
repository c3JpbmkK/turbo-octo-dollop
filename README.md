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
│       │   └── tracer
│       │       └── values.yaml
│       ├── Chart.yaml
│       └── values.yaml
├── clusters
│   └── tracer
├── hubs
│   ├── in-cluster
│   │   ├── templates
│   │   │   └── 00-application-ingress-nginx.yaml
│   │   ├── 00-project.yaml
│   │   └── 01-application.yaml
│   └── visual
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
├── port-forward.sh
├── README.md
├── setup.sh
└── teardown.sh

23 directories, 24 files
```
