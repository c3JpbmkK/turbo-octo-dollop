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
│   └── ingress-nginx
│       ├── clusters
│       │   └── tracer
│       │       └── values.yaml
│       ├── Chart.yaml
│       └── values.yaml
├── clusters
│   ├── tracer
│   └── visual
├── hubs
│   └── in-cluster
│       ├── template
│       │   └── application-ingress-nginx.yaml
│       └── application.yaml
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

21 directories, 20 files
```
