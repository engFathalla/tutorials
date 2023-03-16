# resource "helm_release" "istio_base" {
#   name = "elk"

#   repository       = "https://charts.bitnami.com/bitnami"
#   chart            = "elasticsearch"
#   namespace        = "elk"
#   create_namespace = true
#   version          = "19.5.14"

#   set {
#     name  = "global.istioNamespace"
#     value = "istio-system"
#   }
# }
