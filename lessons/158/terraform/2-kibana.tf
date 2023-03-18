resource "helm_release" "kibana" {
  name = "kibana"

  repository       = "https://charts.bitnami.com/bitnami"
  chart            = "kibana"
  namespace        = "kibana"
  create_namespace = true
  version          = "10.2.16"

  values = [file("values/kibana.yaml")]
}
