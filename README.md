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
├── kill-port-forward.sh
├── nohup.out
├── port-forward.sh
├── README.md
├── setup.sh
└── teardown.sh

19 directories, 15 files
```
