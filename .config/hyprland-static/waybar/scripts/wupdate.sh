#!/bin/bash
# -----------------------------------------------------
# Seleccionar fondo de pantalla y crear esquema de colores
# Modifica la ruta de la carpeta a tu gusto
# -----------------------------------------------------
# Directorio de imágenes
pictures_root_folder=$HOME/Pictures
hyprpaper_config=$HOME/.config/hypr/hyprpaper.conf

# Pregunta al usuario si quiere explorar las imágenes en el directorio principal o en una subcarpeta
echo "¿Quieres explorar las imágenes en el directorio principal o en una subcarpeta?"
echo "1) Directorio principal"
echo "2) Subcarpeta"
read -p "Selecciona una opción (1 o 2): " main_option

if [ "$main_option" == "1" ]; then
    # Selección de imagen directamente desde el directorio principal
    echo "Por favor, selecciona una imagen para usar como fondo de pantalla:"
    select image_file in "$pictures_root_folder"/*; do
        if [ -f "$image_file" ]; then
            break
        else
            echo "Selección inválida. Por favor, elige una imagen válida."
        fi
    done
elif [ "$main_option" == "2" ]; then
    # Selección de subcarpeta y luego de imagen dentro de la subcarpeta
    echo "Por favor, selecciona una carpeta para explorar sus imágenes:"
    select folder_option in "$pictures_root_folder"/*; do
        if [ -d "$folder_option" ]; then
            break
        else
            echo "Selección inválida. Por favor, elige una carpeta válida."
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
        if [ -f "$image_file" ]; then
            break
        else
            echo "Selección inválida. Por favor, elige una imagen válida."
        fi
    done

    # Verifica si se seleccionó una imagen
    if [ -z "$image_file" ]; then
        echo "No se seleccionó ninguna imagen. Saliendo del script."
        exit 1
    fi
else
    echo "Opción no válida. Saliendo del script."
    exit 1
fi

# Actualiza el archivo hyprpaper.conf con la imagen seleccionada
echo "Actualizando hyprpaper config con la imagen seleccionada: $image_file"
sed -i "s|^preload =.*|preload = $image_file|g" $hyprpaper_config
sed -i "s|^wallpaper =.*|wallpaper = ,$image_file|g" $hyprpaper_config

# -----------------------------------------------------
# Ejecutar el script de inicio de waybar
# -----------------------------------------------------
$HOME/.config/waybar/scripts/launch.sh
