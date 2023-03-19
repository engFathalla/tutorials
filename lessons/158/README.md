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

- Declarative setup (https://argo-cd.readthedocs.io/en/stable/operator-manual/declarative-setup/)



## Instal Argocd (bare minimum)

- install kubectl and helm cli
- Install Minikube (https://minikube.sigs.k8s.io/docs/start/) 
- minikube now supports docker
- get nodes
- no taints
- Start minikube `minikube start`
- Start specific k8s version `minikube start --kubernetes-version=v1.26.1`
- Get admin secret `kubectl get secrets argocd-initial-admin-secret -o yaml -n argocd`
- However, most users will want to explicitly configure the certificates for these TLS endpoints, possibly using automated means such as cert-manager or using their own dedicated Certificate Authority. (will help with ingress)
- Expose argocd server`kubectl port-forward svc/argocd-server -n argocd 8080:80`

## Create first CD pipeline with public repo & image

- Create public GitHub repo `lesson-158`
- Create dockerhub account
- Search for nginx image
- Pull image `docker pull nginx:1.23.3`
- `docker images`
- `docker tag nginx:1.23.3 aputra/nginx:v0.1.0`
- `docker push aputra/nginx:v0.1.0`
- Upload nginx image
- Check image in docker hub
- Clone it
- add `myapp` with namespace and deployment
- commit and push
- kubectl apply -f 1-example/application.yaml
- watch kubectl get pods -n prod
- release new verion of the app 
docker tag nginx:1.23.3 aputra/nginx:v0.1.1
docker push aputra/nginx:v0.1.1