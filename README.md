# turbo-octo-dollop

```bash
tree --dirsfirst >> README.md
.
├── apps
│   ├── argocd
│   │   ├── Chart.yaml
│   │   └── values.yaml
│   ├── cert-manager
│   │   ├── Chart.yaml
│   │   └── values.yaml
│   └── ingress-nginx
│       ├── Chart.yaml
│       └── values.yaml
├── clusters
│   ├── tracer
│   └── visual
├── hubs
│   └── in-cluster
│       ├── template
│       │   ├── templates
│       │   ├── Chart.yaml
│       │   └── values.yaml
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
├── nohup.out
├── port-forward.sh
├── README.md
├── setup.sh
└── teardown.sh

20 directories, 21 files
```
