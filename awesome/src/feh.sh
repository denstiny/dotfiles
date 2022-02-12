#!bin/bash
#xinput --disable AT\ Translated\ Set\ 2\ keyboard
rm ~/.shell.lok*
feh --randomize --bg-fill ~/Imager/ &> /dev/null
sleep 60
touch ~/.shell.lok$$ 
bash ~/.config/awesome/src/blue.sh $$ &
while true
do
	ls -a ~/ | grep shell.lok$$ &> /dev/null
	if [ $? == 1 ];
	then
		echo "退出"$$
		exit;
	fi
	feh --randomize --bg-fill ~/Imager/
	sleep 3600
done
