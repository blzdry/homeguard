#!/bin/sh

choice=$(printf "Lock\nLogout\nReboot\nShutdown\nSuspend" | \
    dmenu -i \
    -fn "MartianMonoNerdFont:size=11" \
    -nb "#141c21" \
    -nf "#93a1a1" \
    -sb "#9fc5e8" \
    -sf "#141c21")

case "$choice" in
    Lock)
        i3lock
        ;;
    Logout)
        i3-msg exit
        ;;
    Reboot)
        loginctl reboot
        ;;
    Shutdown)
        loginctl poweroff
        ;;
    Suspend)
        loginctl suspend
        ;;
esac
