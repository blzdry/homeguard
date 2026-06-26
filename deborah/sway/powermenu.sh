#!/bin/bash

options="Lock\nExit\nReboot\nShutdown"

chosen=$(printf "$options" | tofi --prompt-text "Power: ")

case $chosen in
    Lock)
        gtklock ;;
    Exit)
        swaymsg exit ;;
    Reboot)
        systemctl reboot ;;
    Shutdown)
        systemctl poweroff ;;
esac
