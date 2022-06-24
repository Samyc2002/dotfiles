# Use powerline
USE_POWERLINE="true"
# Source manjaro-zsh-configuration
if [[ -e /usr/share/zsh/manjaro-zsh-config ]]; then
  source /usr/share/zsh/manjaro-zsh-config
fi
# Use manjaro zsh prompt
if [[ -e /usr/share/zsh/manjaro-zsh-prompt ]]; then
  source /usr/share/zsh/manjaro-zsh-prompt
fi

alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias ls='exa -lah'
alias clear='clear && colorscript random'
alias py='python3'
alias cls='clear'
alias br='broot -dphsg'
alias python='python3'
alias vi='nvim'
alias vim='nvim'
alias ga='git add'
alias gc='git commit'
alias gp='git push'
alias gP='git pull'

export PATH="$PATH:/home/samy/.local/share/gem/ruby/3.0.0/bin"
export PATH="$HOME/.emacs.d/bin:$PATH" 
export PATH=$PATH:/usr/local/go/bin
# export TERM=alacritty
export TERM="xterm-256color"                      # getting proper colors
   # Welcome text
   clear
export dmenu_run="env LC_ALL=en_US.UTF-8 dmenu_run"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
