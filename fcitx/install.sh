# @author      : aero (2254228017@qq.com)
# @file        : install
# @created     : 星期四 2月 03, 2022 21:46:39 CST ( 03/02/2022 )
# @github      : https://github.com/denstiny
# @blog        : https://denstiny.github.io

#!/bin/bash
sudo pacman -S fcitx5 fcitx5-qt fcitx5-gtk fcitx5-chinese-addons fcitx5-configtool fcitx5-im fcitx5-material-color citx5-chewing fcitx5-pinyin-zhwiki fcitx5-pinyin-moegirl
cp ./.pam_environment ~/
cp -rf ./fcitx5 ~/.config/
