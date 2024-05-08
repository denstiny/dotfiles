#!/usr/bin/env bash
export CAPSSWAPESCAPE=false
Keyboard ()
{
  # 判断键盘
  xinput | grep -i "Telink" &> /dev/null
  if [ $? == 1 ];
  then 
    xinput --enable AT\ Translated\ Set\ 2\ keyboard
    setxkbmap -option caps:swapescape
    export CAPSSWAPESCAPE=true
    echo "启用默认键盘"
  else
    xinput --disable AT\ Translated\ Set\ 2\ keyboard
    if [[ -n $CAPSSWAPESCAPE ]];then
        setxkbmap -option swapescape:caps
        export CAPSSWAPESCAPE=false
    fi
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

#Run() {
#  ls -a ~/ | grep shell$1 &> /dev/null
#  if [[ $? == 1 ]]; then
#    return 1
#  else
#    return 0
#  fi
#}
#
#while [[ Run ]]; do
#  Keyboard
#  Mouse
#  sleep 1
#done
