import numbers
import string


def dmenu(command: string, accent: string, prompt: string) -> string:
    # print(f"{command} -fn Poppins-10 -nb \#282c34 -nf \#bbc2cf -sb \{accent} -sf \#282c34 -W 1900.8 -h 30 -X 9.6 -Y 5.4 -p {prompt}")
    return (f"{command} -fn Poppins-10 -nb \#282c34 -nf \#bbc2cf -sb \{accent} -sf \#282c34 -W 1900.8 -h 30 -X 9.6 -Y 5.4 -p {prompt}")

def dmenuTall(command: string, lines: numbers, accent: string, prompt: string) -> string:
    # print(f"{command} -i -l {lines} -fn Poppins-10 -nb \#282c34 -nf \#bbc2cf -sb \{accent} -sf \#282c34 -W 1900.8 -h 30 -X 9.6 -Y 5.4 -p {prompt}")
    if prompt == "":
        return (f"{command} -i -l {lines} -fn Poppins-10 -nb \#282c34 -nf \#bbc2cf -sb \{accent} -sf \#282c34 -W 1900.8 -h 30 -X 9.6 -Y 5.4")
    else:
        return (f"{command} -i -l {lines} -fn Poppins-10 -nb \#282c34 -nf \#bbc2cf -sb \{accent} -sf \#282c34 -W 1900.8 -h 30 -X 9.6 -Y 5.4 -p {prompt}")
    
code = "code"
vim = "alacritty -e lvim"
emacs = "emacsclient -c -a emacs"
atom = "atom"

browser = "brave"
editor = vim
