#!/usr/bin/env bash
# system-age.sh — outputs system age, current tier, and days until next tier
# Used by ~/.config/fastfetch/config.jsonc via the command module

_birth() {
    if [ -e /lost+found ]; then
        stat -c %Y /lost+found 2>/dev/null
    elif [ -f /var/log/installer/syslog ]; then
        stat -c %Y /var/log/installer/syslog 2>/dev/null
    fi
}

_system_age() {
    local born days
    born=$(_birth)
    [ -z "$born" ] && { echo "unknown"; return; }
    days=$(( ($(date +%s) - born) / 86400 ))

    if [ "$days" -lt 30 ]; then
        echo "${days} days"
    elif [ "$days" -lt 365 ]; then
        printf '%dmo %dd' "$(( days / 30 ))" "$(( days % 30 ))"
    else
        printf '%dyr %dmo' "$(( days / 365 ))" "$(( (days % 365) / 30 ))"
    fi
}

_current_tier() {
    local born days
    born=$(_birth)
    [ -z "$born" ] && { echo "Unknown"; return; }
    days=$(( ($(date +%s) - born) / 86400 ))

    if   [ "$days" -ge 365 ]; then echo "Mythical"
    elif [ "$days" -ge 270 ]; then echo "Diamond"
    elif [ "$days" -ge 180 ]; then echo "Emerald"
    elif [ "$days" -ge  90 ]; then echo "Platinum"
    elif [ "$days" -ge  60 ]; then echo "Gold"
    elif [ "$days" -ge  30 ]; then echo "Silver"
    elif [ "$days" -ge  21 ]; then echo "Bronze"
    elif [ "$days" -ge  14 ]; then echo "Iron"
    elif [ "$days" -ge   7 ]; then echo "Copper"
    else                           echo "Seedling"
    fi
}

_days_until_next() {
    local born days
    born=$(_birth)
    [ -z "$born" ] && { echo "unknown"; return; }
    days=$(( ($(date +%s) - born) / 86400 ))

    local next
    if   [ "$days" -ge 365 ]; then echo "Max tier reached"; return
    elif [ "$days" -ge 270 ]; then next=365
    elif [ "$days" -ge 180 ]; then next=270
    elif [ "$days" -ge  90 ]; then next=180
    elif [ "$days" -ge  60 ]; then next=90
    elif [ "$days" -ge  30 ]; then next=60
    elif [ "$days" -ge  21 ]; then next=30
    elif [ "$days" -ge  14 ]; then next=21
    elif [ "$days" -ge   7 ]; then next=14
    else                           next=7
    fi

    echo "$(( next - days )) days"
}

case "$1" in
    age)       _system_age ;;
    tier)      _current_tier ;;
    next)      _days_until_next ;;
esac
