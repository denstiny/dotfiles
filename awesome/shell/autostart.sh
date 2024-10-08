#!/usr/bin/env bash


function run {
  if ! pgrep -f $1 ;
  then
    $@&
  fi
}

# Resolution
xrandr --output eDP-1 --mode 1920x1200
#xrandr --output eDP-1 --mode 1920x1200 --left-of HDMI-1 --auto
#xrandr --output eDP-1 --auto --primary
#xrandr --output HDMI1 --right-of eDP1 --auto
#xrandr --output HDMI1 --rotate  normal
# Compositor
# picom --config ~/.config/awesome/config/picom.conf &
#run cfw
#run clash
run fcitx5
run flameshot
run obs --disable-shutdown-check
run qv2ray
# open start emacs server
#run emacs --daemon
#ibus-daemon -x -d
####  swap Esc caps
#setxkbmap -option caps:swapescape
###  Change the wallpaper
xset dpms 0 0 0 
xset s noblank && xset s noexpose && xset s off
bash ~/.config/awesome/shell/backgrund.sh &
echo 2 >> /sys/module/hid_apple/parameters/fnmode
