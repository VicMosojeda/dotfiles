#!/bin/bash
# -----------------------------------------------------
# Seleccionar fondo de pantalla y crear esquema de colores
# Modifica la ruta de la carpeta a tu gusto
# -----------------------------------------------------
# Directorio de imágenes
pictures_root_folder=~/Pictures

# Pregunta al usuario qué carpeta desea explorar
echo "Por favor, selecciona una carpeta para explorar sus imágenes:"
select folder_option in "$pictures_root_folder"/*; do
	if [ -n "$folder_option" ]; then
		break
	else
		echo "Selección inválida. Por favor, elige una opción válida."
	fi
done

# Verifica si se seleccionó una carpeta
if [ -z "$folder_option" ]; then
	echo "No se seleccionó ninguna carpeta. Saliendo del script."
	exit 1
fi

# Pregunta al usuario qué imagen desea utilizar como fondo de pantalla dentro de la carpeta seleccionada
echo "Por favor, selecciona una imagen para usar como fondo de pantalla:"
select image_file in "$folder_option"/*; do
	if [ -n "$image_file" ]; then
		break
	else
		echo "Selección inválida. Por favor, elige una opción válida."
	fi
done

# Verifica si se seleccionó una imagen
if [ -z "$image_file" ]; then
	echo "No se seleccionó ninguna imagen. Saliendo del script."
	exit 1
fi

# Copia el fondo de pantalla seleccionado a la carpeta "cache" con el formato original
cp "$image_file" ~/.cache/current_wallpaper.${image_file##*.}

# Ejecuta el comando 'wal' con la imagen seleccionada
wal -q -i "$image_file"

# Cambia el fondo de pantalla utilizando swww
feh --bg-fill "$image_file"

# -----------------------------------------------------
# Carga el esquema de colores elegido a un script
# -----------------------------------------------------
source "$HOME/.cache/wal/colors.sh"

# -----------------------------------------------------
# Ejecutar el script de inicio de waybar
# -----------------------------------------------------
~/.config/qtile/launch.sh
