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
alias cls='clear' #&& colorscript random'
alias py='python3'
alias py-2-7-11='~/.localpython/bin/python'
alias br='broot -dphsg'
alias python='python3'
alias vi='nvim'
alias vim='nvim'
alias gs='git status'
alias ga='git add'
alias gc='git commit'
alias gp='git push'
alias gP='git pull'
alias gb='git branch'
alias startup='sudo modprobe btusb && sudo systemctl start bluetooth && sudo systemctl enable bluetooth; sudo systemctl start warp-svc'
alias update='yay -Syyu; flatpak update'
# alias emacsclient="emacsclient -c -a 'emacs'"
alias emacsclient="emacsclient -c"

export PATH="$PATH:/home/samy/.local/share/gem/ruby/3.0.0/bin"
export PATH="$HOME/.emacs.d/bin:$PATH" 
export PATH="$PATH:/usr/local/go/bin"
# export TERM=alacritty
export TERM="xterm-256color"                      # getting proper colors
export PATH="$PATH:$HOME/.config/rofi/scripts"
export CONFIG_DIR="$HOME/.config/lazygit"
export XDG_DATA_HOME="$HOME/.config"
export tmux="tmux -u"

# These are for my develoment needs
export JAVA_HOME=$HOME/jdk-18.0.2.1
export ANDROID_HOME=$HOME/Android/Sdk
export ANDROID_SDK_ROOT=$HOME/Android/Sdk
export PATH=$PATH:$ANDROID_SDK_ROOT/emulator
export PATH=$PATH:$ANDROID_SDK_ROOT/platform-tools
export PATH=$PATH:$ANDROID_SDK_ROOT/platform
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin

   # Welcome text
   # clear
export dmenu_run="env LC_ALL=en_US.UTF-8 dmenu_run"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
#neofetch

#[ -f "/home/samy/.ghcup/env" ] && source "/home/samy/.ghcup/env" # ghcup-env
[ -f "/home/samy/.ghcup/env" ] && source "/home/samy/.ghcup/env" # ghcup-env

# Starship prompt
# eval "$(starship init zsh)"
#screenfetch
#colorscript random

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
