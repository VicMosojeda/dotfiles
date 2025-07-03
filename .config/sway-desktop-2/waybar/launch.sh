#!/bin/bash

# Finalizar los procesos existentes
killall -q waybar bg hyprlock dunst

# Esperar hasta que los procesos anteriores se hayan cerrado completamente
while pgrep -f "waybar\|bg\|hyprlock\|dunst" >/dev/null; do
	sleep .5
done

# Iniciar los procesos según la condición del usuario
if [ "$USER" = "metadeth" ]; then
	waybar -c ~/.config/waybar/config &
	bg &
else
	waybar &
fi
