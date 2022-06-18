import os
from variables import dmenuTall, browser

DMENU = dmenuTall("printf '%s' | dmenu", 20, "#ecbe7b", "\"Google Search\"")
COMMAND = DMENU + " > tmp.txt"
os.system(COMMAND)

fstream = open("tmp.txt", "r")
search = fstream.readline()
fstream.close()

if len(search) > 0:
    os.remove("tmp.txt")
    os.system(f"{browser} https://www.google.com/search?q={search}")