#!/bin/sh
APP_ID="cf2d94c048d80161efce7ea422d4d5fd74530778086ef7bb31f989922d9048eb"
dest=~/Pictures/Unsplash.jpg
search="abstract"

curl -L "https://api.unsplash.com/photos/random/?client_id=$APP_ID&orientation=landscape&query=$search" | python -c 'import json,sys;obj=json.load(sys.stdin);print obj["urls"]["raw"]' | xargs curl -o "$dest"
scr='tell application "Finder" to set desktop picture to POSIX file "'"$dest"'"'
osascript -e "$scr" 

killall Dock
