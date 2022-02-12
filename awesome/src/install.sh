#bin/shell
ls /bin/ | grep yay &> /dev/null
if [ $? == 1 ]
then
	echo "isntall yay"
	sudo pacman -S yay
fi
ls /bin/ | grep yay &> /dev/null
if [ $? == 0 ];
then
	echo "yay install"
	sudo pacman -S alsa-lib feh awesome  alacritty libconfig light-git calc rofi polybar networkmanager-dmenu 
	yay -S picom-jonaburg-git 
	pip install pywal
	sudo locale-gen
else
	 echo "安装失败，请手动安装yay后重新启动脚本\n"
	 exit
fi
ls /bin/ | grep picom
if [ $? == 1 ];then
	 echo "picom安装失败，请稍候根据帮助文档手动安装 回车继续" && read
fi
# lf /usr/share/awesome/themes | grep fhuizing
# if [ $? == 0 ];
# 	then
# 		echo "安装主题"
# 		mv /usr/share/awesome/themes/fhuizing /usr/share/awesome/themes/fhuizing_m
# 		sudo cp -rf ~/awesome-config/src/fhuizing /usr/share/awesome/themes
# 	else
# 		sudo cp -rf ~/awesome-config/src/fhuizing /usr/share/awesome/themes
# fi

ls ~/.config/ | grep awesome &> /dev/null
if [ $? == 0 ];
then 
	echo "mkdir awesome file "
   mv ~/.config/awesome ~/.config/awesome.mk
   \cp -rvf ~/awesome-config ~/.config/awesome
else
	echo "mkdir awesome file 1"
	\cp -rvf ~/awesome-config ~/.config/awesome
fi
echo "克隆浮动窗口管理工具"
ls ~/.config/awesome | grep collision &> /dev/null
if [ $? == 0 ];then
	 mv ~/.config/awesome/collision ~/.config/awesome/collision.mk
	 cd $HOME && git clone https://github.com/Elv13/collision.git ~/.config/awesome/collision
else
	 cd $HOME && git clone https://github.com/Elv13/collision.git ~/.config/awesome/collision
fi

echo "克隆安装polybar 主题"
ls ~/ | grep polybar-themes &> /dev/null
if [ $? == 1 ];then
	git clone https://github.com/adi1090x/polybar-themes.git 
	cd ~/polybar-themes
	bash setup.sh
fi
	
echo "安装完成,你可以使用Win+s显示快捷键的帮助文档哦"
echo "感谢支持"
notify-send -i ~/.config/awesome/src/s.jpg -t 0 如果你很喜欢 是否可以请我喝一杯奶茶
if [ $? == 1 ];
then 
	 echo "抱歉安装失败，你可以向我反馈问题"
fi
