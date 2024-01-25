#!/bin/bash

# ----------------------------------------------------- 
# Seleccionar fondo de pantalla aleatorio y crear esquema de colores
# Modifica la ruta de la carpeta a tu gusto
# ----------------------------------------------------- 
# Imagen de fondo
wallpapers_folder=~/Pictures/anime
# Imagen de video
# wallpapers_folder=~/Pictures/lives

# Utiliza find para buscar imágenes recursivamente en todas las subcarpetas
image_files=("$wallpapers_folder"/*.{jpg,jpeg,png})

# image_files=("$wallpapers_folder"/*.{mp4})
# image_files=($(find "$wallpapers_folder" -type f -iregex '.*\.\(jpg\|jpeg\|png\|gif\|bmp\|tiff\|webp\|mp4\)'))

if [ ${#image_files[@]} -eq 0 ]; then
    echo "No se encontraron imágenes en la carpeta $wallpapers_folder"
    exit 1
fi

# Selecciona una imagen aleatoria de la lista
random_image=${image_files[RANDOM % ${#image_files[@]}]}

# Imagen de fondo
wal -q -i "$random_image"
# Video de fondo
# mpvpaper -o "no-audio --loop shuffle" "*" "$random_image"

# ----------------------------------------------------- 
# Carga el esquema de colores elegido a un script
# ----------------------------------------------------- 
source "$HOME/.cache/wal/colors.sh"

# ----------------------------------------------------- 
# Copia el fondo de pantalla seleccionado a la carpeta "cache" con el formato original
# ----------------------------------------------------- 
cp "$random_image" ~/.cache/current_wallpaper.${random_image##*.}

# ----------------------------------------------------- 
# Extrae el nombre del fondo de pantalla para mandarlo como notificación
# ----------------------------------------------------- 
# newwall=$(echo "$random_image" | sed "s|$wallpapers_folder/||g")
newwall=$(basename "$random_image")

# ----------------------------------------------------- 
# Cambia el fondo de pantalla cargado a la carpeta "cache"
# ----------------------------------------------------- 
time {
    # Sección del script
    swww img "$random_image" \
        --transition-bezier .43,1.19,1,.4 \
        --transition-fps=60 \
        --transition-type="simple" \
        --transition-duration=0.1 \
        --transition-pos "$( hyprctl cursorpos )"

~/.config/waybar/launch.sh
}


# ----------------------------------------------------- 
# Envía la notificación
# ----------------------------------------------------- 
notify-send "Colores y Fondo de Pantalla" "con imagen $newwall"

echo "Lista de imágenes: ${image_files[@]}"
