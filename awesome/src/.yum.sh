#bin/bash
sh="$1"
app="$2"
intall="install"
update="update"

if [ $sh = $intall ];then 
	yay -S $app
fi
if [ $sh = $update ];then
	 sudo pacman -Syyu
fi
