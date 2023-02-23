#!/usr/bin/env bash


function run {
  if ! pgrep -f $1 ;
  then
    $@&
  fi
}

# Resolution
xrandr --output eDP --mode 1920x1200 --left-of HDMI-A-0 --auto
#xrandr --output eDP1 --auto --primary
#xrandr --output HDMI1 --right-of eDP1 --auto
#xrandr --output HDMI1 --rotate  normal
# Compositor
#picom --config ~/.config/awesome/config/picom.conf &
run clash-for-windows
run fcitx5
run flameshot
run obs
#run qv2ray
# open start emacs server
#run emacs --daemon

####  swap Esc caps
#setxkbmap -option caps:swapescape
###  Change the wallpaper
xset dpms 0 0 0 
xset s noblank && xset s noexpose && xset s off
bash ~/.config/awesome/shell/backgrund.sh &
