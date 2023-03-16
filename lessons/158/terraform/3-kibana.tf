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

  set {
    name  = "elasticsearch.hosts[0]"
    value = "elk-elasticsearch-coordinating-hl.elk"
  }

  set {
    name  = "elasticsearch.port"
    value = "port"
  }

  set {
    name  = "tolerations[0].key"
    value = "elk"
  }

  set {
    name  = "tolerations[0].operator"
    value = "Exists"
  }

  set {
    name  = "tolerations[0].effect"
    value = "NoSchedule"
  }
}
