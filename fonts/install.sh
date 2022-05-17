# @author      : aero (2254228017@qq.com)
# @file        : install
# @created     : 星期三 2月 09, 2022 12:51:21 CST 
# @github      : https://github.com/denstiny
# @blog        : https://denstiny.github.io

#!/bin/bash
# 下载字体
sudo pacman -S noto-fonts-cjk ttf-joypixels
cp ./*.otf ~/.local/share/fonts/
cp ./*.ttf ~/.local/share/fonts/
# 设置字体
cp font.conf /etc/fonts/conf.d/fonts.conf
