#!/bin/bash

# Finalizar los procesos existentes
killall -q waybar swaync

# Esperar hasta que los procesos anteriores se hayan cerrado completamente
while pgrep -f "waybar\|swaync" >/dev/null; do
	sleep .5
done

# Iniciar los procesos según la condición del usuario
if [ "$USER" = "dreamsmeta" ]; then
	waybar -c ~/.config/waybar/config &

	swaync &
else
	waybar &
fi
