#!/bin/bash
effects=("grow" "wave" "any" "fade")
random_index=$(( RANDOM % ${#effects[@]} )) 
img=$(sxiv -to ~/wallpaper/ | head -n 1 | awk -F'/' '{print $NF}')
swww img -t "${effects[random_index]}" ~/wallpaper/"$img"


