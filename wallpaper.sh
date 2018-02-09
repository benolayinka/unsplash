#!/bin/sh
APP_ID="cf2d94c048d80161efce7ea422d4d5fd74530778086ef7bb31f989922d9048eb"
dest="/Users/Ben1/Pictures/Unsplash.jpg"

curl -L "https://api.unsplash.com/photos/random/?client_id=$APP_ID&orientation=landscape&query=abstract" | jq -r '.urls.raw' | xargs wget -O "$dest"

scr='tell application "Finder" to set desktop picture to POSIX file "'"$dest"'"'
osascript -e "$scr" 

killall Dock
