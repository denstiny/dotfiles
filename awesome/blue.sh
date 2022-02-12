#!bin/bash
Keyboard ()
{
    # 判断键盘
    xinput | grep -i "Compx 2.4G Wireless Receiver Keyboard" &> /dev/null
    if [ $? == 1 ];
    then 
        xinput --enable AT\ Translated\ Set\ 2\ keyboard
        echo "启用默认键盘"
    else
        xinput --disable AT\ Translated\ Set\ 2\ keyboard
        echo "关闭默认键盘"
    fi
}

Mouse() {
    # 判断鼠标
    xinput | grep -i "2.4G Mouse System Control" &> /dev/null
    if [ $? == 1 ];
    then 
        echo "启用默认鼠标"
        xinput --enable  `xinput  | grep Touch | awk -F ' ' '{print $6}' | awk -F '=' '{print $2}'`
    else
        echo "关闭默认鼠标"
        xinput --disable  `xinput  | grep Touch | awk -F ' ' '{print $6}' | awk -F '=' '{print $2}'`
    fi
}

Run() {
    ls -a ~/ | grep shell$1 &> /dev/null
    if [[ $? == 1 ]]; then
        return 1
    else
        return 0
    fi
}

while [[ Run ]]; do
    Keyboard
    Mouse
    sleep 1
done
