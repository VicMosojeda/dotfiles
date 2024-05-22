#!/bin/bash

# Finalizar los procesos existentes
killall -q waybar hyprpaper hyprlock dunst

# Esperar hasta que los procesos anteriores se hayan cerrado completamente
while pgrep -f "waybar\|hyprpaper\|hyprlock\|dunst" >/dev/null; do
	sleep .5
done

# Iniciar los procesos según la condición del usuario
if [ "$USER" = "dreamsmeta" ]; then
	waybar -c ~/.config/waybar/config &
	hyprpaper &
else
	waybar &
fi
