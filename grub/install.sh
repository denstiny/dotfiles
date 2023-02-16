# @author      : aero (2254228017@qq.com)
# @file        : install
# @created     : 星期六 2月 12, 2022 16:40:32 CST 
# @github      : https://github.com/denstiny
# @blog        : https://denstiny.github.io

#!/bin/bash
cp -r catppuccin-grub-theme /usr/share/grub/themes/
echo 'GRUB_THEME="/usr/share/grub/themes/catppuccin-grub-theme/theme.txt"' >> /etc/default/grub
grub-mkconfig -o /boot/grub/grub.cfg
