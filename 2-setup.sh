configure_filesystem() {
	export LFS=/mnt/lfs
	umask 022
	sudo mkdir -pv $LFS
	sudo mount -v -t ext4 /dev/nvme0n1p6 $LFS
	sudo chown root:root $LFS
	sudo chmod 755 $LFS
}

sudo ln -sf /bin/bash /usr/bin/sh	
configure_filesystem




