- Declarative setup (https://argo-cd.readthedocs.io/en/stable/operator-manual/declarative-setup/)



## Instal Argocd (bare minimum) #1

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

## Create first CD pipeline with public repo & image #1

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
- add `my-app` with namespace and deployment
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


## Create CD pipeline with private repo and private image #2

- create private github repo `lesson-158-private`
- clone `git clone git@github.com:antonputra/lesson-158-private.git`
- create folders `environments/staging/my-app`
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
- kubectl create secret docker-registry dockerconfigjson \
    --docker-server="https://index.docker.io/v1/" \
    --docker-username=aputra \
    --docker-password=DOCKER_PASSWORD \
    --docker-email=me@antonputra.com
- generatae dockerhub token
- create `2-example/secret.yaml`
- apply `kubectl apply -f 2-example/secret.yaml`
- get pods
- describe pod (pull access denied for aputra/nginx-private, repository does not exist or may require 'docker login)
- pull image from private repo - https://kubernetes.io/docs/tasks/configure-pod-container/pull-image-private-registry/
- generate github token: read only - minikube
- add 
```
      imagePullSecrets:
        - name: dockerconfigjson
```
- commit and push
- delete application `kubectl delete -f 2-example/application.yaml`
- show in ui application is missing
- check pods, all pods are up
- kubectl delete ns staging
- add finilizer
```
  finalizers:
    - resources-finalizer.argocd.argoproj.io
```
- apply `kubectl apply -f 2-example/application.yaml`
- kubectl create secret docker-registry dockerconfigjson \
    --docker-server="https://index.docker.io/v1/" \
    --docker-username=aputra \
    --docker-password=DOCKER_PASSWORD \
    --docker-email=me@antonputra.com
- generatae dockerhub token
- delete application `kubectl delete -f 2-example/application.yaml`
- check that pods are gone

## argocd app of apps (yaml) #2
You can create an app that creates other apps, which in turn can create other apps. This allows you to declaratively manage a group of apps that can be deployed and configured in concert.

- create `environments/staging/apps`
- clone `my-app` to `second-app`
- replace both images to `aputra/nginx:v0.1.0`
- create `environments/staging/apps/my-app.yaml`
- create `environments/staging/apps/second-app.yaml`
- create `3-example`
- create `3-example/application.yaml`
- kubectl apply -f 3-example/application.yaml
- kubectl get pods -n staging
- kubectl get pods -n dev
- kubectl delete -f 3-example/application.yaml
- kubectl get pods -n staging
- kubectl get pods -n dev




















## helm #2
from repo
from source

## helm (argocd app of apps) #2
## AppProject

## kustomize #2


## argocd image updater #3

## argocd autopilot (gitops app promostion)

## argocd workflow #4

## argocd multiple clusters #5
## argocd application set #5



## argocd eks (ingress) terraform

