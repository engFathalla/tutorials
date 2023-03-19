resource "helm_release" "argocd" {
  name = "argocd"

  repository       = "https://istio-release.storage.googleapis.com/charts"
  chart            = "argo-cd"
  namespace        = "istio-system"
  create_namespace = true
  version          = "3.35.4"

  values = [file("values/argocd.yaml")]
}
