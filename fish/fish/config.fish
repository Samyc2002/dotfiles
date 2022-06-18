if status is-interactive
    # Commands to run in interactive sessions can go here
    clear && colorscript random
    starship init fish | source
    alias clear='clear && colorscript random'
    alias doom='~/.emacs.d/bin/doom'
    alias ls='exa -lah'
    alias py='python3'
    alias cls='clear'
    set fish_greeting
    set fish_color_error red --bold
    set fish_color_normal white
    set fish_color_command green
    set fish_color_keyword magenta
    set fish_color_quote yellow
    set fish_color_end blue
end
