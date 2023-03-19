argocd tutorial
argocd helm
argocd workflow
argocd application set
argocd image updater
argocd demo
argocd kustomize
argocd app of apps
argocd multiple clusters
argocd autopilot
argocd eks
ingress to expose argocd-server





## Instal Argocd (bare minimum)

- install kubectl and helm cli
- Install Minikube (https://minikube.sigs.k8s.io/docs/start/) 
- minikube now supports docker
- get nodes
- no taints
- Start minikube `minikube start`
- Start specific k8s version `minikube start --kubernetes-version=v1.26.1`
- Get admin secret `kubectl get secrets argocd-initial-admin-secret -o yaml -n argocd`
- However, most users will want to explicitly configure the certificates for these TLS endpoints, possibly using automated means such as cert-manager or using their own dedicated Certificate Authority.
- Expose argocd server`kubectl port-forward svc/argocd-server -n argocd 8080:80`
