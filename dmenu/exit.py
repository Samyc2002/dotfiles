import os
from variables import dmenu

options = {
    "Lock": "xscreensaver-command -lock",
    "Logout": "loginctl kill-session $XDG_SESSION_ID",
    "Reboot": "reboot",
    "Shut Down": "poweroff"
}

optionsString = "\"" + "\" \"".join(options.keys()) + "\""

os.system(dmenu(f"printf '%s\n' {optionsString} | dmenu", "#ff6c6b", "\"Careful, bud:)\"") + " > tmp.txt")

fstream = open("tmp.txt", "r")
action = fstream.readline()
fstream.close()

os.remove("tmp.txt")

if action != "":
    os.system(options[action[:-1]])