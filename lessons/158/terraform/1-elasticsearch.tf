resource "helm_release" "elasticsearch" {
  name = "elasticsearch"

  repository       = "https://charts.bitnami.com/bitnami"
  chart            = "elasticsearch"
  namespace        = "elk"
  create_namespace = true
  version          = "19.5.14"

  values = [file("")]
}
