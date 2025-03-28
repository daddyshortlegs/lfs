create_base_directories() {
	sudo mkdir -pv $LFS{etc,var} $LFS/usr/{bin,lib,sbin}
	for i in bin lib sbin; do
		sudo ln -sv usr/$i $LFS/$i
	done

	case $(uname -n) in
		x86_64) sudo mkdir -pv $LFS/lib64 ;;
	esac

	sudo mkdir -pv $LFS/tools
}	

setup_lfs_user() {
	sudo groupadd lfs
	sudo useradd -s /bin/bash -g lfs -m -k /dev/null lfs
	sudo passwd lfs

	sudo chown -v lfs $LFS/{usr{,/*},var,etc,tools}
	case $(uname -m) in
		x86_64) sudo chown -v lfs $LFS/lib64 ;;
	esac
}

export LFS=/mnt/lfs

create_base_directories
setup_lfs_user

# Remember to put this back at the end
[ ! -e /etc/bash.bashrc ] || sudo mv -v /etc/bash.bashrc /etc/bash.bashrc.NOUSE

