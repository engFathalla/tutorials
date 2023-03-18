# resource "helm_release" "istio_base" {
#   name = "ssd"

#   repository       = "https://kubernetes-sigs.github.io/sig-storage-local-static-provisioner"
#   chart            = "local-static-provisioner"
#   namespace        = "storage"
#   create_namespace = true
#   version          = "1.0.0"

#   set {
#     name  = "classes[0].name"
#     value = "ssd"
#   }

#   set {
#     name  = "classes[0].hostDir"
#     value = "/mnt/disks"
#   }

#   set {
#     name  = "classes[0].volumeMode"
#     value = "Filesystem"
#   }

#   set {
#     name  = "classes[0].fsType"
#     value = "ext4"
#   }

#   set {
#     name  = "classes[0].namePattern"
#     value = "*"
#   }

#   set {
#     name  = "classes[0].blockCleanerCommand[0]"
#     value = "/scripts/shred.sh"
#   }

#   set {
#     name  = "classes[0].blockCleanerCommand[1]"
#     value = "2"
#   }

#   set {
#     name  = "classes[0].storageClass"
#     value = "true"
#   }
# }
