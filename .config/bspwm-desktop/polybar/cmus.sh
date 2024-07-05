#!/bin/bash

prepend_zero () {
    seq -f "%02g" $1 $1
}

song_info=$(cmus-remote -Q | grep -e "title" -e "artist")
song=$(echo "$song_info" | grep "title" | cut -d ' ' -f 3-)
artist=$(echo "$song_info" | grep "artist" | cut -d ' ' -f 3-)

if [ -n "$song" ]; then
    echo -n "$artist - $song"
else
    file_name=$(cmus-remote -C status | grep "file" | cut -d ' ' -f 2-)
    file_name_no_extension=$(basename "$file_name" | sed 's/\.mp3$//')
    echo -n "$file_name_no_extension"
fi
