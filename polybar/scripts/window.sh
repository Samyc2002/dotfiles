#! /usr/bin/env bash

window=$TITLE

parts=$(echo $IN | tr ";" "\n")

app=$(parts[-1])

output=""

for part in $parts; do
    if [[ $part != $app ]]; then
        output+=$(echo $part | cut -d "-" -f 1)
    fi
done

echo $window