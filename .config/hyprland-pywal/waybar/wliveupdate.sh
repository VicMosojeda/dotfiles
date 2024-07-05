#!/bin/bash

wlive_root_folder=~/Videos

# Función para verificar la existencia y validez de la carpeta seleccionada
verify_folder_selection() {
    if [ ! -d "$folder_option" ]; then
        echo "La carpeta seleccionada no es válida. Por favor, elige una opción válida."
        return 1
    fi
    return 0
}

# Función para verificar la existencia y validez del archivo de video seleccionado
verify_video_selection() {
    if [ ! -f "$video_file" ]; then
        echo "El archivo de video seleccionado no es válido. Por favor, elige una opción válida."
        return 1
    fi
    return 0
}

# Pregunta al usuario qué carpeta desea explorar
echo "Por favor, selecciona una carpeta para explorar sus videos:"
select folder_option in "$wlive_root_folder"/*; do
    verify_folder_selection "$folder_option" && break
done

# Verifica si se seleccionó una carpeta válida
if [ -z "$folder_option" ]; then
    echo "No se seleccionó ninguna carpeta. Saliendo del script."
    exit 1
fi

# Pregunta al usuario qué video desea utilizar como fondo de pantalla dentro de la carpeta seleccionada
echo "Por favor, selecciona un archivo de video para usar como fondo de pantalla:"
select video_file in "$folder_option"/*; do
    verify_video_selection "$video_file" && break
done

# Verifica si se seleccionó un archivo de video válido
if [ -z "$video_file" ]; then
    echo "No se seleccionó ningún archivo de video. Saliendo del script."
    exit 1
fi

# Copia el video seleccionado a la carpeta "cache" con el formato original
cp "$video_file" ~/.cache/current_wallpaper.${video_file##*.}

# Ejecuta el comando 'wal' con el archivo de video seleccionado
wal -q -i "$video_file"

# Verificar si mpvpaper ya está en ejecución y detenerlo si es necesario
if pgrep -x "mpvpaper" > /dev/null; then
    killall -q mpvpaper
fi

# Cambia el fondo de pantalla utilizando mpvpaper
mpvpaper -vs -o "no-audio loop" eDP-1 "$video_file" &

# Esperar un breve momento antes de continuar
sleep 0.5

# Verificar si mpvpaper se inició correctamente
if ! pgrep -x "mpvpaper" > /dev/null; then
    echo "Error: No se pudo iniciar mpvpaper correctamente."
    exit 1
fi

# Cargar el esquema de colores elegido a un script
source "$HOME/.cache/wal/colors.sh"

# Ejecutar el script de inicio de waybar
~/.config/waybar/launch.sh
