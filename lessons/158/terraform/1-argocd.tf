resource "helm_release" "argocd" {
  name = "argo-cd"

  repository       = "https://istio-release.storage.googleapis.com/charts"
  chart            = "argo-cd"
  namespace        = "argocd"
  create_namespace = true
  version          = "3.35.4"

  values = [file("terraform/values/argo-cd.yaml")]
}
