#!/usr/bin/sh
# puts now playing from clementine into xclip to paste
# to use with irssi, do:
# /alias np exec - -out /path/to/script
# then /np to print in current window
# add -n option to display only $artist and $track without $album (useful for statusbar display
# so it doesn't take too much space

artist="$(qdbus-qt4 org.mpris.clementine /Player GetMetadata | grep artist | sed 's/artist: //')"
track="$(qdbus-qt4 org.mpris.clementine /Player GetMetadata | grep title | sed 's/title: //')"
album="$(qdbus-qt4 org.mpris.clementine /Player GetMetadata | grep album | sed 's/album: //')"

while getopts ":n" opt; do
    case $opt in
        n)
            echo 'np: '$artist '-' $track
            exit 0
            ;;
        \?)
            echo 'Usage: np [-n]'
            exit 0
            ;;
    esac
done
echo 'np: '$artist '-' $track '('$album')'
