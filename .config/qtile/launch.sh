#!/bin/bash

# Finalizar los procesos existentes
killall -q cbatticon volumeicon nm-applet picom

# Esperar hasta que los procesos anteriores se hayan cerrado completamente
while pgrep -f "cbatticon\|volumeicon\|nm-applet\|picom" >/dev/null; do
    sleep 0.5
done

# Iniciar los procesos según la condición del usuario
[ "$USER" = "dreamsmeta" ] && cbatticon & volumeicon & nm-applet &

# Establecer el fondo de pantalla si existe un archivo almacenado
[ -f "$HOME/.cache/current_wallpaper" ] && feh --bg-fill "$(cat "$HOME/.cache/current_wallpaper")"

# Iniciar picom si no está en ejecución
pgrep -x picom > /dev/null || picom --config "$HOME/.config/picom/picom.conf" &