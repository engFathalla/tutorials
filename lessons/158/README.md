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
AppProject
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
- `docker login --username aputra`
- `docker push aputra/nginx:v0.1.0`
- Upload nginx image
- Check image in docker hub
- Clone it
- add `myapp` with namespace and deployment
- commit and push
- kubectl apply -f 1-example/application.yaml
- watch kubectl get pods -n prod
- go back to argocd ui and explose architecture of the app
- release new verion of the app 
- docker tag nginx:1.23.3 aputra/nginx:v0.1.1
- docker push aputra/nginx:v0.1.1
- updade in git and push
- go back to ui, wait 5 minutes or click refresh
- click sync
- mentione .git suffix in the repository URL
- update to automatic sync `1-example/application.yaml`
- kubectl apply -f 1-example/application.yaml
- release new version
- docker tag nginx:1.23.3 aputra/nginx:v0.1.2
- docker push aputra/nginx:v0.1.2
- commit and push
- open argocd ui and wait app upgrade
- check pod in the terminal
- create a script to automaticly release a new verion and update git `upgrade.sh`
- chmod +x upgrade.sh
- remove application `kubectl delete -f 1-example/application.yaml`


## Create CD pipeline with private repo and private image

- create private github repo `lesson-158-private`
- clone `git clone git@github.com:antonputra/lesson-158-private.git`
- create folders `environments/staging/myapp`
- create staging namespace and deployment with private image
- create private dockerhub repo `aputra/nginx-private`
- `docker tag nginx:1.23.3 aputra/nginx-private:v0.1.0`
- `docker login --username aputra`
- `docker push aputra/nginx-private:v0.1.0`
- commit and push
- create 2-example
- apply application `kubectl apply -f 2-example/application.yaml`
- check errro in argocd ui `rpc error: code = Unknown desc = error creating SSH agent: "SSH agent requested but SSH_AUTH_SOCK not-specified"`
- SSH using a private-public key-pair for authentication (explain about personal tockens and github apps)
- SSH key that grants access to a single repository
- instructions to setup deploy keys - https://docs.github.com/en/authentication/connecting-to-github-with-ssh/managing-deploy-keys#set-up-deploy-keys
- ssh-keygen -t ed25519 -C "argocd@antonputra.com" -f argocd_ed25519
- for legacy "sh-keygen -t rsa -b 4096 -C "argocd@antonputra.com" -f argocd_ed25519
- open this key (don't commit this key with the code)
- add deploy key "argocd"
- create `2-example/secret.yaml`
- apply `kubectl apply -f 2-example/secret.yaml`
- get pods
- describe pod (pull access denied for aputra/nginx-private, repository does not exist or may require 'docker login)
- pull image from private repo - https://kubernetes.io/docs/tasks/configure-pod-container/pull-image-private-registry/
- generate github token: read only - minikube




- add finilizer

- setup personal access token, mentione github app authenticate maybe implement later on





- setup github app authentication