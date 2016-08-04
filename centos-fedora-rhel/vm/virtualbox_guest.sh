
yum install gcc kernel-devel kernel-headers dkms make bzip2 perl
KERN_DIR=/usr/src/kernels/`uname -r`
export KERN_DIR

curl http://download.virtualbox.org/virtualbox/5.0.16/VBoxGuestAdditions_5.0.16.iso > /tmp/image.iso

mkdir -p /tmp/mnt && mount /tmp/image.iso /tmp/mnt
/tmp/mnt/VBoxLinuxAdditions.run
umount /tmp/mnt && rm -rf /tmp/mnt
