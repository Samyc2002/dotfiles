import os
from variables import dmenu, dmenuTall

os.system(dmenuTall("nmcli device wifi list | sed -n '1!p' | cut -b 9- | dmenu", 20, "#82aaff", "\"Select Wifi  :\" | cut -d' ' -f1 > tmp.txt"))
fstream = open("tmp.txt", "r")
bssid = fstream.readline()[:-1]
fstream.close()
os.remove("tmp.txt")

print(bssid)

os.system(dmenu("echo \"\" | dmenu", "#82aaff", "\"Enter Password  :\" > tmp.txt"))
fstream = open("tmp.txt", "r")
password = fstream.readline()[:-1]
fstream.close()
os.remove("tmp.txt")

print(password)

if bssid != "" and password != "":
    os.system(f"[ -n \"${password}\" ] && nmcli device wifi connect \"{bssid}\" password \"{password}\" || nmcli device wifi connect \"{bssid}\"")
    os.system("sleep 10")