#!bin/bash

while true
do
	ls -a ~/ | grep shell.lok$1 &> /dev/null
	if [ $? == 1 ]; then
		echo "退出"$$
		exit;
	fi
	# 判断键盘
	xinput | grep -i "KEYBOARD"
	if [ $? == 1 ];
	then 
		xinput --enable AT\ Translated\ Set\ 2\ keyboard
		echo "open the key"
	else
		xinput --disable AT\ Translated\ Set\ 2\ keyboard
		echo "Shut down  key"
	fi
	setxkbmap -option caps:swapescape  
	# 判断鼠标
	xinput | grep -i "USB GAMING MOUSE"
	if [ $? == 0 ];
	then 
		echo "open the Mouse"
		xinput --enable  `xinput  | grep Touch | awk -F ' ' '{print $6}' | awk -F '=' '{print $2}'`
	else
		echo "shut down Mouse"
		xinput --disable  `xinput  | grep Touch | awk -F ' ' '{print $6}' | awk -F '=' '{print $2}'`
	fi
	sleep 3

done
