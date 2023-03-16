resource "helm_release" "fluentd" {
  name = "logging"

  repository       = "https://charts.bitnami.com/bitnami"
  chart            = "fluentd"
  namespace        = "logging"
  create_namespace = true
  version          = "5.5.16"

  set {
    name  = "forwarder.tolerations[0].key"
    value = "fluentd"
  }

  set {
    name  = "forwarder.tolerations[0].operator"
    value = "Exists"
  }

  set {
    name  = "forwarder.tolerations[0].effect"
    value = "NoSchedule"
  }
}
