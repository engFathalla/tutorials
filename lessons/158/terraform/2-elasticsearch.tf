# resource "helm_release" "elk" {
#   name = "elk"

#   repository       = "https://charts.bitnami.com/bitnami"
#   chart            = "elasticsearch"
#   namespace        = "elk"
#   create_namespace = true
#   version          = "19.5.14"

#   set {
#     name  = "data.persistence.storageClass"
#     value = "ssd"
#   }

#   set {
#     name  = "data.persistence.size"
#     value = "100Gi"
#   }
# }
