resource "helm_release" "provisioner" {
  name = "provisioner"

  repository       = "https://kubernetes-sigs.github.io/sig-storage-local-static-provisioner"
  chart            = "local-static-provisioner"
  namespace        = "storage"
  create_namespace = true
  version          = "1.0.0"


  values = [file("values/local-static-provisioner.yaml")]
}
