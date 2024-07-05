#!/bin/bash

# Verificar si se ha proporcionado un argumento
if [ $# -eq 1 ]; then
    case $1 in
        play-pause)
            cmus-remote -u
            ;;
        next)
            cmus-remote -n
            ;;
        prev)
            cmus-remote -r
            ;;
    esac
    exit 0
fi

# Obtener la canción actual en cmus
cmus_status=$(cmus-remote -Q 2>/dev/null)
if [ $? -eq 0 ]; then
    artist=$(echo "$cmus_status" | grep 'tag artist' | cut -d ' ' -f 3-)
    title=$(echo "$cmus_status" | grep 'tag title' | cut -d ' ' -f 3-)
    file=$(echo "$cmus_status" | grep '^file ' | cut -d ' ' -f 2-)
    filename=$(basename "$file")
    
    # Quitar la extensión .mp3 (o cualquier otra extensión) del nombre del archivo
    filename_no_ext="${filename%.*}"
    
    if [ -n "$title" ]; then
        echo " 󰝚 $title"
    else
        echo " 󰝚 $filename_no_ext"
    fi
    exit 0
fi

# Si no hay una canción reproduciéndose, no mostrar nada
echo ""
