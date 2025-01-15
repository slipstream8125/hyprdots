#!/bin/bash
#                _ _                              
# __      ____ _| | |_ __   __ _ _ __   ___ _ __  
# \ \ /\ / / _` | | | '_ \ / _` | '_ \ / _ \ '__| 
#  \ V  V / (_| | | | |_) | (_| | |_) |  __/ |    
#   \_/\_/ \__,_|_|_| .__/ \__,_| .__/ \___|_|    
#                   |_|         |_|               
#  
# inspired by Stephan Raabe (2023) 
# ----------------------------------------------------- 

# Cache file for holding the current wallpaper
cache_file="$HOME/.cache/current_wallpaper"
rasi_file="$HOME/.cache/current_wallpaper.rasi"

# Create cache file if not exists
if [ ! -f "$cache_file" ] ;then
    touch "$cache_file"
    echo "$HOME/hyprdots/wallpaper/default.jpg" > "$cache_file"
	ln -s "$HOME/hyprdots/wallpaper/default.jpg" "$HOME/.cache/wallpaper"
fi

# Create rasi file if not exists
if [ ! -f "$rasi_file" ] ;then
    touch "$rasi_file"
    echo "* { current-image: url(\"$HOME/hyprdots/wallpaper/default.jpg\", height); }" > "$rasi_file"
fi

current_wallpaper='$HOME/.cache/wallpaper'

# case $1 in
#
#     # Load wallpaper from .cache of last session 
#     "init")
#         sleep 1
#         if [ -f "$cache_file" ]; then
#             wal -q -i "$current_wallpaper"
#         else
#             wal -q -i ~/hyprdots/wallpaper/
#         fi
#     ;;
#
#     # Select wallpaper with wofi
#     *)
#         sleep 0.2
#         selected=$( find "$HOME/hyprdots/wallpaper" -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" \) -exec basename {} \; | sort -R | while read rfile
#         do
#             echo -en "$rfile\x00icon\x1f$HOME/wallpaper/${rfile}\n"
#         done | wofi -dmenu -i --no-show-icons)
#         if [ ! "$selected" ]; then
#             echo "No wallpaper selected"
#             exit
#         fi
#         wal -q -i ~/hyprdots/wallpaper/"$selected"
# 		ln -sf "$HOME/hyprdots/wallpaper/$selected" "$HOME"/.cache/wallpaper
#     ;;
#
#     # Randomly select wallpaper 
#     "random")
#         wal -q -i ~/hyprdots/wallpaper/
#     ;;
#
# esac
#
# ----------------------------------------------------- 
# Load current pywal color scheme
# ----------------------------------------------------- 
source "$HOME/.cache/wal/colors.sh"
echo ":: Wallpaper: $wallpaper"

# ----------------------------------------------------- 
# get wallpaper image name
# ----------------------------------------------------- 
newwall=$(echo "$wallpaper" | sed "s|$HOME/hyprdots/wallpaper/||g")

# ----------------------------------------------------- 
# Reload waybar with new colors
# -----------------------------------------------------
~/dotfiles/waybar/launch.sh

# ----------------------------------------------------- 
# Set the new wallpaper
# -----------------------------------------------------
# transition_type="wipe"
transition_type="outer"
# transition_type="random"

#  wallpaper_engine=$(cat $HOME/hyprdots/hypr/scripts/wallpaper-engine.sh)
# # wallpaper_engine = "hyprpaper"
# if [ "$wallpaper_engine" == "swww" ] ;then
#     # swww
#     echo ":: Using swww"
    swww img "$wallpaper" \
        --transition-bezier .43,1.19,1,.4 \
        --transition-fps=144 \
        --transition-type="$transition_type" \
        --transition-duration=0.4 
        # --transition-pos "$( hyprctl cursorpos )"
# elif [ "$wallpaper_engine" == "hyprpaper" ] ;then
    # hyprpaper
    # echo ":: Using hyprpaper"
    # killall hyprpaper
    # wal_tpl=$(cat "$HOME"/hyprdots/hypr/scripts/hyprpaper.tpl)
    # output=${wal_tpl//WALLPAPER/$wallpaper}
    # echo "$output" > "$HOME"/hyprdots/hypr/hyprpaper.conf
    # hyprpaper &
# else
#     echo ":: Wallpaper Engine disabled"
# fi

if [ "$1" == "init" ] ;then
    echo ":: Init"
else
    sleep 1
 #   dunstify "Changing wallpaper ..." "with image $newwall" -h int:value:33 -h string:x-dunst-stack-tag:wallpaper
    sleep 2
fi

# # ----------------------------------------------------- 
# # Created blurred wallpaper
# # -----------------------------------------------------
# if [ "$1" == "init" ] ;then
#     echo ":: Init"
# else
#     dunstify "Creating blurred version ..." "with image $newwall" -h int:value:66 -h string:x-dunst-stack-tag:wallpaper
# fi
#
# magick $wallpaper -resize 75% $blurred
# echo ":: Resized to 75%"
# if [ ! "$blur" == "0x0" ] ;then
#     magick $blurred -blur $blur $blurred
#     echo ":: Blurred"
# fi

# ----------------------------------------------------- 
# Write selected wallpaper into .cache files
# ----------------------------------------------------- 
echo "$wallpaper" > "$cache_file"
rm "$HOME"/.current_wallpaper
ln -s "$wallpaper" "$HOME"/.current_wallpaper
matugen image "$wallpaper"
# echo "* { current-image: url(\"$blurred\", height); }" > "$rasi_file"

# ----------------------------------------------------- 
# Send notification
# ----------------------------------------------------- 
#dunstify "Setting theme in waybar"
	pkill -USR2 waybar
#dunstify "Waybar theme set"
#dunstify "Changing dunst theme"
#	mkdir -p  "${HOME}/.config/dunst"
#	ln -sf    "${HOME}/.cache/wal/dunstrc" "${HOME}/.config/dunst/dunstrc"
#	pkill dunst
#	dunst &
#dunstify "Dunst theme changed"

# --------------------------------------------------------
# Change swaync theme
# --------------------------------------------------------
	swaync-client --reload-css


# --------------------------------------------------------
# Change Zellij theme
# --------------------------------------------------------
~/hyprdots/hypr/scripts/zellijpywal/generate-theme.sh

pywalfox update

# Notify pywal work is done
if [ "$1" == "init" ] ;then
    echo ":: Init"
else
    dunstify "Pywal procedure complete!"
fi

echo "DONE!"

