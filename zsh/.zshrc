export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
plugins=(git zsh-autosuggestions autopep8 command-not-found)

source $ZSH/oh-my-zsh.sh

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi
export proxy=http://127.0.0.1
export TERM=wezterm
source ~/.zsh/proxy.sh
alias re=ranger
alias ters=~/Workspace/Terslation/translation/fanyim.py
alias apt=aptpac
export GO111MODULE=on
export GOPROXY=https://goproxy.cn,direct
