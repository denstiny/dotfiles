#!/usr/bin/env bash

pictures_dir="$(xdg-user-dir PICTURES 2> /dev/null)"
slice="${pictures_dir:-$HOME/.config/awesome/theme/titlebar}/slice.png"

image=$(mktemp --tmpdir --suffix=.png lock.XXXXXXXXXX)
trap 'rm -f "$image"' SIGINT SIGTERM EXIT

screens=$(xrandr | grep -Eo '[0-9]+x[0-9]+\+[0-9]+\+[0-9]+')
declare -a lines

# slice height
S=160

# line position (from center)
P=0

for screen in $screens; do
    read -r W H X Y < <(sed 's/[^0-9]/ /g' <<< "$screen")
    lines+=(\( "$slice"
        -resize "${S}x${S}!"
        -geometry "+$((W/2-S/2))+$((Y+H/2-P-S/2-150))" \)
        -composite -matte)
done

maim -u -m 1 \
    | convert png:- -scale 10% -scale 1000% \
    -fill "#282828" -colorize 10% \
    ${lines[*]} "$image"

i3lock \
    --color=191724 \
    --image="$image" \
    --inside-color=19172400 \
    --insidever-color=191724FF \
    --insidewrong-color=191724FF \
    --ring-color=19172400 \
    --ringver-color=FABD2FFF \
    --ringwrong-color=FB4934FF \
    --separator-color=191724FF \
    --line-color=EBDBB2FF \
    --keyhl-color=EBDBB2FF \
    --bshl-color=FB4934FF \
    --ring-width=4 \
    --radius=32 \
    --ind-pos="x+w/2:y+h/2-$P" \
    --time-color=A89984FF \
    --time-pos='ix-180:iy+100' \
    --time-pos='ix-r-50:iy+100' \
    --time-str='%H:%M:%S' \
    --time-font='monospace' \
    --time-align=2 \
    --time-size=32 \
    --date-color=A89984FF \
    --date-pos='ix+180:iy+100' \
    --date-pos='ix+r+50:iy+100' \
    --date-str='%d.%m.%y' \
    --date-font='monospace' \
    --date-align=1 \
    --date-size=32 \
    --greeter-pos='x+100:iy+100' \
    --verif-color=00000000 \
    --wrong-color=00000000 \
    --modif-color=00000000 \
    --layout-color=00000000 \
    --greeter-color=00000000 \
    --verif-text='' \
    --wrong-text='' \
    --noinput-text='' \
    --lock-text='' \
    --lockfailed-text='' \
    --greeter-text='' \
    --ignore-empty-password \
    --pass-media-keys \
    --pass-screen-keys \
    --indicator \
    --clock
    #--special-passthrough \

