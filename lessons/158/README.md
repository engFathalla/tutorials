- https://argo-cd.readthedocs.io/en/stable/operator-manual/declarative-setup/
- https://docs.aws.amazon.com/AmazonECR/latest/userguide/push-oci-artifact.html







kubectl label node node-00 service=myapp
kubectl label node node-01 service=myapp

kubectl taint nodes node-00 fluentd=true:NoSchedule
kubectl taint nodes node-01 fluentbit=true:NoSchedule

kubectl taint nodes node-02 elk=true:NoSchedule
kubectl taint nodes node-03 elk=true:NoSchedule

kubectl taint nodes node-04 kibana=true:NoSchedule

kubectl label node node-02 service=elasticsearch
kubectl label node node-03 service=elasticsearch


kubectl label node node-04 service=kibana




http://192.168.50.210:9000





kubectl label node node-02 service=s3 --overwrite
kubectl label node node-03 service=s3 --overwrite
kubectl label node node-04 service=s3 --overwrite

kubectl taint nodes node-02 s3=true:NoSchedule
kubectl taint nodes node-03 s3=true:NoSchedule
kubectl taint nodes node-04 s3=true:NoSchedule


kubectl taint nodes node-02 elk=true:NoSchedule-
kubectl taint nodes node-03 elk=true:NoSchedule-
kubectl taint nodes node-04 kibana=true:NoSchedule-



sudo mkdir -p /mnt/disks

sudo mkfs.ext4 /dev/sdb
DISK_UUID=$(sudo blkid -s UUID -o value /dev/sdb) 
sudo mkdir /mnt/disks/$DISK_UUID
sudo mount -t ext4 /dev/sdb /mnt/disks/$DISK_UUID

echo UUID=`sudo blkid -s UUID -o value /dev/sdb` /mnt/disks/$DISK_UUID ext4 defaults 0 2 | sudo tee -a /etc/fstab




sudo mkfs.ext4 /dev/sdc
DISK_UUID=$(sudo blkid -s UUID -o value /dev/sdc) 
sudo mkdir /mnt/disks/$DISK_UUID
sudo mount -t ext4 /dev/sdc /mnt/disks/$DISK_UUID

echo UUID=`sudo blkid -s UUID -o value /dev/sdc` /mnt/disks/$DISK_UUID ext4 defaults 0 2 | sudo tee -a /etc/fstab







BoanS4qNFh1ciuuI
CG4edX8gEAONn2XHxfQNqVm4ImpbwzGG

kubectl apply -f monitoring/monitoring-ns.yaml
kubectl apply --server-side -f monitoring/prometheus-operator-crds

kubectl apply --server-side -R -f monitoring