#!/usr/bin/env bash


function run {
  if ! pgrep -f $1 ;
  then
    $@&
  fi
}

# Resolution
#xrandr --output eDP1- --mode 1920x1080 --same-as eDP1 --auto &
xrandr --output eDP1 --auto --primary
xrandr --output HDMI1 --right-of eDP1 --auto
xrandr --output HDMI1 --rotate  normal

# Compositor
systemctl start v2raya.service
picom --config ~/.config/awesome/config/picom.conf &
run clash
run fcitx5
run flameshot
#run obs
run qv2ray
# open start emacs server
#run emacs --daemon

####  swap Esc caps
#setxkbmap -option caps:swapescape
###  Change the wallpaper
bash ~/.config/awesome/backgrund.sh
