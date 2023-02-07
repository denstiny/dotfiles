#!/usr/bin/env bash
rm ~/.shell.lok*

# ls ~/ | grep Imager &> /dev/null
# if [ $? == 1 ];
# then
# 	mkdir ~/Imager
# else
# 	echo "The folder is"
# fi

#feh --randomize --bg-fill ~/.dotfile/wallpaper/ &> /dev/null
feh --randomize --bg-fill ~/Imager/ &> /dev/null
lock=$$
touch ~/.shell.lok$lock 
echo "创建进程锁文件"

bash ~/.config/awesome/shell/blue.sh $lock  && echo "执行blue" &
while true
do
	ls -a ~/ | grep shell.lok$lock &> /dev/null
	if [ $? == 1 ];
	then
		echo "退出"$lock
		exit;
	fi
  feh --randomize --bg-fill ~/Imager/ &> /dev/null
	sleep 1000
done
wait
echo "退出外设监控"
