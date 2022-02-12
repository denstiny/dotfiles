#!/usr/bin/env bash

DIR=`pwd`
FDIR="$HOME/.local/share/fonts"
PDIR="$HOME/.config/awesome"


# install fonts
### https://github.com/adi1090x/polybar-themes#grayblocks
install_fonts() {
	echo -e "\n[*] Installing font ..."
	if [[ ! -f "/usr/bin/rofi" ]]; then
		echo -e "\n[*] Installing rofi"
		sudo pacman -S rofi
	fi
	if [[ -d "$FDIR" ]]; then
		cp -rf $DIR/fonts/* "$FDIR"
	else
		mkdir -p "$FDIR"
		cp -rf $DIR/fonts/* "$FDIR"
	fi
}
# install awesome configuration
install_awesome_configuration() {
	echo -e "\n[*] Installing awesome configuration"
	if [[ -d "$PDIR" ]]; then
		echo -e "\n[*] move awesome define files"
		mv $PDIR $PDIR".mk"
	fi
	if [[ ! -d "$PDIR" ]]; then
		echo -e "\n[*] cp configuration"
		cp -rf ../awesome $PDIR
	fi
}
# install awesome  rely on
install_rely() {
	if [[ ! -d "/usr/bin/light" ]]; then
		echo -e "\n   [*]install xbacklight"
		sudo pacman -S xorg-xbacklight
		sudo usermod -a -G video $USER
	fi
	if [[ ! -d "/usr/share/i3lock" ]]; then
		echo -e "\n   [*]install i3-lock"
		sudo pacman -S i3lock
	fi
}

# Main 
main() {
	install_fonts
	install_awesome_configuration
	install_rely
}


main
