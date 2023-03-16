resource "helm_release" "kibana" {
  name = "kibana"

  repository       = "https://charts.bitnami.com/bitnami"
  chart            = "kibana"
  namespace        = "elk"
  create_namespace = true
  version          = "10.2.16"

  set {
    name  = "nodeSelector.service"
    value = "elk"
  }

  set {
    name  = "persistence.enabled"
    value = "false"
  }
}
