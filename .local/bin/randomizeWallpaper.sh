#!/bin/sh

bgPath = "$(XDG_DATA_HOME:-$HOME/.local/share)/bg" 
newBgPath = "$(readlink -f "$1")" &&
	case "$(file --mime-type -b $newBgPath)" in
		image/* ) cp "$(readlink -f "$1")" bgPath && notify-send "Changed wallpaper" "Changed it to $newBgPath" ;;
		inode/directory ) newBgPath="$(ls "$(readlink -f "$1")" | grep ".*.\(jpg\|jpeg\|png\|gif\)" | shuf -n 1)" && cp $newBgPath $bgPath && 

xwallpaper --zoom $imagePath
