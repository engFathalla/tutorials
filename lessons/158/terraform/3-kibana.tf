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
    name  = "service.type"
    value = "LoadBalancer"
  }

  set {
    name  = "elasticsearch.hosts[0]"
    value = "elk-elasticsearch-coordinating-hl.elk"
  }

  set {
    name  = "elasticsearch.port"
    value = "9200"
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
