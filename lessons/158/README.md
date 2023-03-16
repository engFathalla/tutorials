helm repo add local-static-provisioner https://kubernetes-sigs.github.io/sig-storage-local-static-provisioner







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


kubectl label node node-00 service=elk

kubectl taint nodes node-00 elk=true:NoSchedule