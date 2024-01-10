#!/bin/sh


MONITOR_TIMEOUT=300
LOCK_TIMEOUT=3600


if command -v swayidle > /dev/null;  then
    swayidle -w timeout $LOCK_TIMEOUT 'swaylock -f' timeout $MONITOR_TIMEOUT 'hyprctl dispatch dpms off' resume 'hyprctl dispatch dpms on'
else
    echo "swayidle not installed."
fi;
