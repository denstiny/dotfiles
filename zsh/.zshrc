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
export GOPATH="$HOME/go"
#export PATH=$PATH:$GOPATH/bin
#export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:/usr/local/go/bin
#export PATH=$PATH:$HOME/.cargo/bin
#export RUSTUP_HOME=$HOME/.rustup
#export CARGO_HOME=$HOME/.cargo/bin
export GO111MODULE=on
export GOPROXY=https://goproxy.cn,direct
source $HOME/.cargo/env
proxy ()
{
  export http_proxy=http://127.0.0.1:7890
  export https_proxy=http://127.0.0.1:7890
}
uproxy () {
  unset http_proxy
  unset https_proxy
}

function ranger {
  local IFS=$'\t\n'
  local tempfile="$(mktemp -t tmp.XXXXXX)"
  local ranger_cmd=(
  command
  ranger
  --cmd="map Q chain shell echo %d > "$tempfile"; quitall"
)
${ranger_cmd[@]} "$@"
if [[ -f "$tempfile" ]] && [[ "$(cat -- "$tempfile")" != "$(echo -n `pwd`)" ]]; then
  cd -- "$(cat "$tempfile")" || return
fi
command rm -f -- "$tempfile" 2>/dev/null
}

#export TERM=wezterm
#[ "$TERM" = "xterm-256color" ] && export TERM=wezterm
#[ "$TERM" = "xterm-kitty" ] && alias ssh="kitty +kitten ssh"
alias re=ranger
alias ters=~/Public/Terslation/termal.sh
alias n="clear && neofetch --off"
alias tnew="tmux new -s"
alias tdeach="tmux detach"
alias tls="tmux ls"
alias tkill="tmux kill-session -t"
alias tattach="tmux attach -t"
alias tswitch="tmux switch -t"
alias trename="tmux rename-session -t"
#alias apt=aptpac
#alias wallpaper_picker=~/.config/hypr/scripts/wallpaper/wallpaper_picker
# >>> xmake >>>
#[[ -s "$HOME/.xmake/profile" ]] && source "$HOME/.xmake/profile" # load xmake profile
# <<< xmake <<<
export ELASTIC_PASSWORD="*BRk9Pk13tg1x+P2chi="
export QT_LOGGING_TO_CONSOLE=1
export LANG=en_US.UTF-8
export LC_ALL="en_US.UTF-8"
export FZF_DEFAULT_OPTS="--height 40% --layout=reverse --preview '(highlight -O ansi {} || cat {}) 2> /dev/null | head -500'"

function fnvim { nvim $(fzf) }
function fcd { cd $(find -type d | fzf) }
