if status is-interactive
    set -U fish_greeting ""
    # Commands to run in interactive sessions can go here
    clear
    export EDITOR=/bin/nvim
    alias ters='python /mnt/home/Terslation/translation/fanyim.py'
    alias screenkey='screenkey -p fixed -g  (slop -n -f '%g')'
    alias nvim='export LANG="en_US.UTF-8" && /usr/bin/nvim'
    alias re=ranger
    alias xvb = 'xwinwrap -ov -fs -- mpv --panscan=1.0 --no-input-default-bindings -loop -no-audio -no-osc -vo x11 -wid WID ~/path/to/video.mp4'
    set -g -x RANGER_LOAD_DEFAULT_RC FALSE
end
