resource "helm_release" "fluent_bit" {
  name = "fluent-bit"

  repository       = "https://fluent.github.io/helm-charts"
  chart            = "fluent-bit"
  namespace        = "logging"
  create_namespace = true
  version          = "0.24.0"

  values = [file("values/fluent-bit.yaml")]
}
