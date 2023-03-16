helm repo add local-static-provisioner https://kubernetes-sigs.github.io/sig-storage-local-static-provisioner







sudo mkdir -p /mnt/disks

sudo mkfs.ext4 /dev/sdb
DISK_UUID=$(sudo blkid -s UUID -o value /dev/sdb) 
sudo mkdir /mnt/disks/$DISK_UUID
sudo mount -t ext4 /dev/sdb /mnt/disks/$DISK_UUID

echo UUID=`sudo blkid -s UUID -o value /dev/sdb` /mnt/disks/$DISK_UUID ext4 defaults 0 2 | sudo tee -a /etc/fstab

