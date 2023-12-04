# @author      : aero (2254228017@qq.com)
# @file        : a
# @created     : 星期一 5月 16, 2022 00:08:09 CST 
# @github      : https://github.com/denstiny
# @blog        : https://denstiny.github.io

#!/usr/bin/env bash

xbg_xrandr() {
    var=$1
    screen=`xrandr | grep " connected" | cut -f1 -d " "`
    brigh=`xrandr --verbose | grep "Brightness" | grep -Eo '[0-9].[0-9]+'`
    if [[ $var == 1 ]]; then
        key=`echo $brigh + 0.1 | bc` 
        if [[ $brigh > 1 ]];then
            echo "xrandr ok " + $brigh
            exit 0
        fi
    else

        if [[ $brigh < 0.5 ]];then
            echo "xrandr ok " + $brigh
            exit 0
        fi
        key=`echo $brigh - 0.1 | bc` 
    fi
    xrandr --output $screen --brightness $key
    if [[ $? == 0 ]]; then
        echo "xrandr ok " + $brigh
        exit 0
    fi
}

xbg_light () {
    var=$1
    if [[ $var == 1 ]]; then
        light -A 10
    else
        light -U 10
    fi
    if [[ $? == 0 ]]; then
        echo "light ok"
        exit 0
    fi
}

xbg_xorg () {
    var=$1
    if [[ $var == 1 ]]; then
        xbacklight -inc 10
    else
        xbacklight -dec 10
    fi
    if [[ $? == 0 ]]; then
        echo "xorg ok"
        exit 0
    fi
}

xbg_brightnessctl() {
    var=$1
    if [[ $var == 1 ]]; then
        brightnessctl -q s 1%+
    else
        brightnessctl -q s 1%-
    fi
    if [[ $? == 0 ]]; then
        echo "xbg_brightnessctl ok"
        exit 0
    fi
}

main() {
    xbg_brightnessctl $1
    xbg_light $1
    xbg_xorg $1
    xbg_xrandr $1
}

main $1
