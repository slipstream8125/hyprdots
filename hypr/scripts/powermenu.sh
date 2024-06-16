#!/bin/bash

op=$( echo -e " Poweroff\n Reboot\n Suspend\n Lock\n Logout" | wofi -i --dmenu | awk '{print tolower($2)}' )

case $op in 
        poweroff)
                shutdown now;;
        reboot)
                reboot;;
        suspend)
                systemctl suspend
                ;;
        lock)
				hyprlock
                ;;
        logout)
                 loginctl terminate-user $USER
                ;;
esac
