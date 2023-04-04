export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
plugins=(git zsh-autosuggestions autopep8 command-not-found calc zlong_alert zsh-safe-rm)
setopt AUTO_PUSHD                  
setopt PUSHD_MINUS                 
setopt CDABLE_VARS                 
autoload -U compinit && compinit
source $ZSH/oh-my-zsh.sh
zlong_send_notifications=false
zlong_duration=1
zlong_ignore_cmds="vim ssh nvim ranger re lazgit fzf"
eval "$(lua ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/z.lua/z.lua --init zsh)"
eval "$(atuin init zsh)"
# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi
export GO111MODULE=on
export GOPROXY=https://goproxy.cn,direct

proxy ()
{
  export http_proxy=http://127.0.0.1:7890
  export https_proxy=http://127.0.0.1:7890
}
uproxy ()
{
  unset http_proxy
  unset https_proxy
}



export TERM=wezterm
alias re=ranger
alias ters=~/Public/Terslation/translation/fanyim.py
#alias apt=aptpac
#alias wallpaper_picker=~/.config/hypr/scripts/wallpaper/wallpaper_picker

# >>> xmake >>>
#[[ -s "$HOME/.xmake/profile" ]] && source "$HOME/.xmake/profile" # load xmake profile
# <<< xmake <<<
