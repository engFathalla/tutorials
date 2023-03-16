resource "helm_release" "elk" {
  name = "elk"

  repository       = "https://charts.bitnami.com/bitnami"
  chart            = "elasticsearch"
  namespace        = "elk"
  create_namespace = true
  version          = "19.5.14"

  set {
    name  = "data.persistence.storageClass"
    value = "ssd"
  }

  set {
    name  = "data.persistence.size"
    value = "97Gi"
  }

  set {
    name  = "master.masterOnly"
    value = "false"
  }

  set {
    name  = "master.persistence.storageClass"
    value = "ssd"
  }

  set {
    name  = "master.nodeSelector.service"
    value = "elk"
  }

  set {
    name  = "data.nodeSelector.service"
    value = "elk"
  }

  set {
    name  = "coordinating.nodeSelector.service"
    value = "elk"
  }
}
