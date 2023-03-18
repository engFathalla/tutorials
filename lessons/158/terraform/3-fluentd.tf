resource "helm_release" "fluentd" {
  name = "logging"

  repository       = "https://charts.bitnami.com/bitnami"
  chart            = "fluentd"
  namespace        = "logging"
  create_namespace = true
  version          = "5.5.16"

  values = [file("values/fluentd.yaml")]
}
