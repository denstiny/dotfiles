# @author      : aero (2254228017@qq.com)
# @file        : install
# @created     : Wednesday Feb 15, 2023 19:22:37 CST 
# @github      : https://github.com/denstiny
# @blog        : https://denstiny.github.io

#!/usr/bin/env bash
sudo pacman -S zsh atuin
git clone https://github.com/Aloxaf/fzf-tab ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/fzf-tab
git clone --depth 1 https://github.com/skywind3000/z.lua.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/z.lua
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/arzzen/calc.plugin.zsh.git  ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/calc
git clone https://github.com/kevinywlui/zlong_alert.zsh  ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zlong_alert
chsh -s $(which zsh)

