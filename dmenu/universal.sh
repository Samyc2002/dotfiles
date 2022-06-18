#!/usr/bin/env bash

DMENU="dmenu -i -l 20 -fn Poppins-10 -nb #282c34 -nf #bbc2cf -sb #ecbe7b -sf #282c34 -W 1900.8 -h 30 -X 9.6 -Y 5.4"
BROWSER="brave"

while [[ -z "$selection" ]]; do
    selection=$(printf '%s' | $DMENU -p "Google Search") || exit
done

REGEX=='[-A-Za-z0-9\+&@#/%?=~_|!:,.;]*[-A-Za-z0-9\+&@#/%=~_|]'

if [[ $selection  =~ $REGEX ]]; then
    echo "F that ain't an url."
    awk $selection -F ':' '{ print $1 }'
else
    $BROWSER $selection
fi

# $BROWSER "https://www.google.com/search?q="$selection
