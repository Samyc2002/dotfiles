#!/bin/bash

# Terminate already running bar instances
killall -q polybar
# If all your bars have ipc enabled, you can also use 
# polybar-msg cmd quit

# Launch Polybar, using default config location ~/.config/polybar/config
# polybar window 2>&1 | tee -a /tmp/polybar.log & disown
# polybar widgets 2>&1 | tee -a /tmp/polybar.log & disown
polybar topbar 2>&1 | tee -a /tmp/polybar.log & disown
# polybar workspaces 2>&1 | tee -a /tmp/polybar.log & disown
# polybar sysinfo 2>&1 | tee -a /tmp/polybar.log &
# polybar tray 2>&1 | tee -a /tmp/polybar.log &

echo "Polybar launched..."
