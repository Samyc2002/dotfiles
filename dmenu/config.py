import os
from variables import dmenuTall, editor

options = [
    "BASH - $HOME/.bashrc",
    "ZSH - $HOME/.zshrc",
    "FISH - $HOME/.config/fish/config.fish",
    "VIM - $HOME/.vimrc",
    "AWESOMEWM - $HOME/.config/awesome/rc.lua",
    # "LEFTWM - $HOME/.config/leftwm",
    "XMONAD - $HOME/.xmonad/xmonad.hs",
    "BSPWM - $HOME/.config/bspwm/bspwmrc",
    "SXHKD - $HOME/.config/sxhkd/sxhkdrc",
    "POLYBAR - $HOME/.config/polybar/config",
    "XMOBAR - $HOME/.config/xmobar/xmobarrc",
    "PICOM - $HOME/.config/picom/picom.sample.conf",
    "ALACRITTY - $HOME/.config/alacritty/alacritty.yml",
    "DOOM EMACS init.el - $HOME/.config/doom/init.el",
    "DOOM EMACS config.el - $HOME/.config/doom/config.el",
    "DOOM EMACS packages.el - $HOME/.config/doom/packages.el",
]
optionString = "\"" + "\" \"".join(options) + "\""

os.system(dmenuTall(f"printf '%s\n' {optionString} | sed -e 's/ - /-/' | dmenu", 20, "#51afef", "\"Good Luck!\" > tmp.txt"))

fstream = open("tmp.txt", "r")
file = fstream.readline()
fstream.close()

os.remove("tmp.txt")

if file != "":
    config = file.split("-")[-1]
    os.system(f"{editor} {config}")
            