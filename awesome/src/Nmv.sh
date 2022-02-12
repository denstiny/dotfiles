ls /mnt/home/ | grep Garbage &> /dev/null
if [ $? == 1 ]; 
	then
		mkdir /mnt/home/Garbage
fi

\mv $* /mnt/home/Garbage/ &> /dev/null
if [ $? == 0 ];
	then
		echo $* > /mnt/home/Garbage.txt
	fi
if [ $1 == '-clear' ];
then
	# 清空文件
	\rm -rf /mnt/home/Garbage/* /mnt/home/Garbage/.* &> /dev/null
fi

if [ $1 == '-h' ];
then
	echo "
	In order to prevent accidental deletion of files,
	a full version of this installation was made，
	The deleted files will be saved at /mnt/home/Garbage
	
	-u     Recover the last deleted file
	-clear Empty the recycle bin
	"
fi


if [ $1 == '-u' ];
	# 恢复上一个文件
then
	for i in `cat /mnt/home/Garbage.txt`
		do
			\mv "/mnt/home/Garbage/"$i ./
			echo "/mnt/home/Garbage/"$i
		done
fi
