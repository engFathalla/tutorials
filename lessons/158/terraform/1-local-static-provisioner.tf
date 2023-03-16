resource "helm_release" "istio_base" {
  name = "elk"

  repository       = "https://kubernetes-sigs.github.io/sig-storage-local-static-provisioner"
  chart            = "local-static-provisioner"
  namespace        = "storage"
  create_namespace = true
  version          = "1.0.0"

  set {
    name  = "classes.0.storageClass"
    value = "true"
  }
}
