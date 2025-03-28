download_packages() {
	sudo mkdir -v $LFS/sources
	sudo chmod -v a+wt $LFS/sources
	wget https://www.linuxfromscratch.org/lfs/view/stable/wget-list-sysv 
	wget --input-file=wget-list-sysv --continue --directory-prefix=$LFS/sources
	sudo chown root:root $LFS/sources/*
}

verify_packages() {
	pushd $LFS/sources
		wget https://www.linuxfromscratch.org/lfs/view/stable/md5sums
		md5sum -c md5sums
	popd
}

download_packages
verify_packages

