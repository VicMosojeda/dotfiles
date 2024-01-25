#!/bin/bash

# Finalizar los procesos existentes
killall -q waybar
killall -q swaybg
killall -q swaync

# Esperar hasta que los procesos anteriores se hayan cerrado completamente
while pgrep -f "waybar\|swaybg\|swaync" > /dev/null; do
    sleep 0.5
done

# Iniciar los procesos según la condición del usuario
if [ "$USER" = "dreamsmeta" ]; then
    waybar -c ~/.config/waybar/config &
    swaybg -i ~/.cache/current_wallpaper.jpg &
    swaync &
else
    waybar &
fi
