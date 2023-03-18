resource "helm_release" "minio" {
  name = "minio"

  repository       = "https://charts.bitnami.com/bitnami"
  chart            = "minio"
  namespace        = "s3"
  create_namespace = true
  version          = "12.1.12"

  values = [file("values/minio.yaml")]
}
