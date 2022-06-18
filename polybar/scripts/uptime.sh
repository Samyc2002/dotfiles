#! /usr/bin/env bash

uptime=$(uptime -p | sed -e 's/up //g')

echo $uptime