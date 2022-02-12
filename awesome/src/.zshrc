# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Source manjaro-zsh-configuration
if [[ -e /usr/share/zsh/manjaro-zsh-config ]]; then
  source /usr/share/zsh/manjaro-zsh-config
fi
# Use manjaro zsh prompt
if [[ -e /usr/share/zsh/manjaro-zsh-prompt ]]; then
  source /usr/share/zsh/manjaro-zsh-prompt
fi
alias ters="python  ~/Terslation/translation/fanyim.py"
alias gg=lazygit
alias youtu="youtube-dl --proxy socks5://127.0.0.1:7891"
alias ptom="bash ~/.config/awesome/compton.sh"
alias initpr="bash ~/.config/Project-directory/Project.sh"
alias apt="bash ~/.apt.sh"
alias yum="bash ~/.yum.sh"
alias pac="sudo pacman"
alias Rw="st -e bash /home/aercn/.config/awesome/src/in.sh &> /dev/null"
alias book="ranger /mnt/home/PDF"
alias Float="notify-send -i ~/est.jpg -t 0 \"Awesome wm\" \"github:denstiny\""
alias re=ranger
alias swapkey="setxkbmap -option caps:swapescape"
alias skim="sk --ansi -i -c 'rg --color=always --line-number \"{}\"'"




# fzf
export FZF_DEFAULT_OPTS="--height 70% --layout=reverse --preview '(highlight -O ansi {} || cat {}) 2> /dev/null | head -500'"



export EDITOR=nvim  # 更改默认的编辑器
#export LANG=en_US.UTF-8
export WINEARCH=win32

# 工作目录
pdf="/mnt/home/PDF"
code="/mnt/home/code"
notes="/mnt/home/notes"




#ffmpeg -i [video] -f image2 output_%d.jpg
#source ~/.config/awesome/fzf.sh
alias fnvim="nvim \$(fzf --height 40%)"

#\clear
printf '\n%.0s' {1..$LINES}
#printf '\n%.0s' {1..50}
alias clear="printf '\n%.0s' {1..$LINES}"

#echo -e "\033[2J \033[0m"
#printf '\033[5 q\r'
#alias clear="printf '\n%.0s' {1..$LINES}"
bash ~/.config/awesome/src/init.sh
PROMPT='%{$fg[green]%}  > '
#RPS1='%{$fg[yellow]%}%~'
#xmodmap ~/.xmodmap &> /dev/null
