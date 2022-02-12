#bin/bash
sh="$1"
app="$2"
intall="install"
update="update"

if [ $sh = $intall ];then 
	 pkgfile $app
	 pamac install $app
fi
if [ $sh = $update ];then
	 sudo pacman -Syyu
fi
