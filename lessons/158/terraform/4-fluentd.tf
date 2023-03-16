resource "helm_release" "kibana" {
  name = "logging"

  repository       = "https://charts.bitnami.com/bitnami"
  chart            = "fluentd"
  namespace        = "elk"
  create_namespace = true
  version          = "0.3.9"
}
