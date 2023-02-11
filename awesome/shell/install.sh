# @author      : aero (2254228017@qq.com)
# @file        : install
# @created     : 星期一 2月 06, 2023 17:19:07 CST 
# @github      : https://github.com/denstiny
# @blog        : https://denstiny.github.io

#!/usr/bin/env bash

sudo pacman -S brightnessctl xorg-xbacklight inotify-tools flameshot pamixer
echo "options hid_apple fnmode=2" >> /etc/modprobe.d/hid_apple.conf
