#!/bin/bash

case "$1" in
  vol-up)
    pactl set-sink-volume @DEFAULT_SINK@ +2%
    vol=$(pactl get-sink-volume @DEFAULT_SINK@ | grep -o '[0-9]\+%' | head -1)
    dunstify -a "Volumen" -u low -r 9993 -h int:value:"${vol%\%}" "🔊 Volumen: $vol"
    ;;
  vol-down)
    pactl set-sink-volume @DEFAULT_SINK@ -2%
    vol=$(pactl get-sink-volume @DEFAULT_SINK@ | grep -o '[0-9]\+%' | head -1)
    dunstify -a "Volumen" -u low -r 9993 -h int:value:"${vol%\%}" "🔉 Volumen: $vol"
    ;;
  bright-up)
    brightnessctl set +2%
    bri=$(brightnessctl get)
    max=$(brightnessctl max)
    percent=$((100 * bri / max))
    dunstify -a "Brillo" -u low -r 9994 -h int:value:"$percent" "💡 Brillo: $percent%"
    ;;
  bright-down)
    brightnessctl set 2%-
    bri=$(brightnessctl get)
    max=$(brightnessctl max)
    percent=$((100 * bri / max))
    dunstify -a "Brillo" -u low -r 9994 -h int:value:"$percent" "🌙 Brillo: $percent%"
    ;;
esac

