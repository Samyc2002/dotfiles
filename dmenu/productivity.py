import os
from variables import dmenu, emacs

options = {
    "Add/Remove TODO Task": "$EDITOR $HOME/Documents/agenda.org",
    "View TODO List": "$EDITOR -e '(org-todo-list)'",
    "View Agenda": "emacs --daemon || $EDITOR -e '(org-agenda-list)'"
}
optionString = "\"" + "\" \"".join(options.keys()) + "\""

os.system(dmenu(f"printf '%s\n' {optionString} | sed -e 's/ - /-/' | dmenu", "#a9a1e1", "\"Good Luck for the Day !\" > tmp.txt"))

fstream = open("tmp.txt", "r")
action = fstream.readline()
fstream.close()

os.remove("tmp.txt")

if action != "":
    os.system(options[action[:-1]])