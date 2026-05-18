#!/bin/bash
set -euo pipefail

INSTALL_NVIDIA=true
VERBOSE=true
APT_FLAGS="-y"                          

log() { [[ "$VERBOSE" == true ]] && echo "$@" || true; }

usage() {
    cat <<EOF
Usage: ${0##*/} [options]

Options:
  --no-nvidia             Skip NVIDIA driver installation
  --silent                Suppress every messages, little to no text output
  -h, --help              Show this help message

Examples:
  ${0##*/}                          # Default
  ${0##*/} --no-nvidia              # Skip NVIDIA installation
  ${0##*/} --silent                 # Suppress messages
  ${0##*/} --no-nvidia --silent     # Skip NVIDIA, suppress messages
EOF

}

while [[ $# -gt 0 ]]; do
    case "$1" in
        --no-nvidia)
            INSTALL_NVIDIA=false
            shift
            ;;
        --silent)
            VERBOSE=false
            APT_FLAGS="-yqq"
            shift
            ;;
        -h | --help)
            usage
            exit 0
            ;;
        *)
            echo "Unknown option: $1" >&2
            usage >&2
            exit 1
            ;;
    esac
done

as_root() {
    if [[ $EUID -eq 0 ]]; then
        echo "Do not run as root!" >&2
        exit 1
    fi
}

nvidia() {
    if [ "$INSTALL_NVIDIA" = false ]; then
        log "Skipping NVIDIA installation"
        return
    fi

    sudo apt-get install -y linux-headers-amd64 build-essential nvidia-detect
    nvidia-detect
    sudo apt-get install -y nvidia-driver
}

main_pkgs() {
    sudo apt-get install $APT_FLAGS --no-install-recommends \
        gcc curl git vim tmux \
        ttf-mscorefonts-installer fonts-noto fonts-noto-cjk fonts-noto-cjk-extra fonts-noto-color-emoji \
        fonts-noto-core \
        i3 i3status i3lock j4-dmenu-desktop picom dunst feh brightnessctl \
        xorg xinit x11-xserver-utils pulseaudio pulseaudio-utils alsa-utils \
        pavucontrol lxappearance arc-theme papirus-icon-theme network-manager \
        unzip xdg-utils xdg-user-dirs lxpolkit gvfs-backends thunar thunar-volman \
        ffmpegthumbnailer ffmpeg mpv mousepad redshift flameshot xclip libnotify-bin obs-studio \
        7zip
}

outside_deb() {
    curl -sS https://debian.griffo.io/EA0F721D231FDD3A0A17B9AC7808B4DD62C41256.asc | sudo gpg --dearmor --yes -o /etc/apt/trusted.gpg.d/debian.griffo.io.gpg && echo "deb https://debian.griffo.io/apt $(lsb_release -sc 2>/dev/null) main" | sudo tee /etc/apt/sources.list.d/debian.griffo.io.list

    sudo apt-get update $APT_FLAGS && sudo apt-get install $APT_FLAGS ghostty

    sudo curl -fsSLo /usr/share/keyrings/brave-browser-nightly-archive-keyring.gpg https://brave-browser-apt-nightly.s3.brave.com/brave-browser-nightly-archive-keyring.gpg && sudo curl -fsSLo /etc/apt/sources.list.d/brave-browser-nightly.sources https://brave-browser-apt-nightly.s3.brave.com/brave-browser.sources

    sudo apt-get update $APT_FLAGS && sudo apt-get install $APT_FLAGS brave-origin-nightly
}

font_pack() {
    local font_dir="$HOME/.local/share/fonts"
    local nf_urls="/tmp/fonts.txt"

    mkdir -p "$font_dir"

    cat > "$nf_urls" << 'EOF'
https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/MartianMono.zip
https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/JetBrainsMono.zip
https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/IosevkaTerm.zip
https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/GeistMono.zip
https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/CascadiaCode.zip
EOF

    cd "$font_dir"
    wget -q -i "$nf_urls"

    for zip in ./*.zip; do
        [ -f "$zip" ] && unzip -q -o "$zip"
    done

    fc-cache -f && rm -f ./*.zip
    rm -f "$nf_urls"
    cd "$HOME"
}

cursor_theme() {
    local cursor_dir="$HOME/.icons"
    mkdir -p "$cursor_dir/default"

    cat > "$cursor_dir/default/index.theme" << 'EOF'
[Icon Theme]
Name=Default
Comment=Default Cursor Theme
Inherits=Geared
EOF

    cd "$cursor_dir"
    wget -q -O geared.7z https://github.com/piraker-grinor/geared-cursor/releases/download/v1.1/Geared-1.1.7z

    7z x geared.7z

    mv cursors/ Geared/
    rm -f geared.7z

    cd "$HOME"
}

git_repos() {
    git clone https://github.com/magicmonty/bash-git-prompt.git ~/.bash-git-prompt --depth=1

    tee -a "$HOME/.bashrc" << 'EOF'

if [ -f "$HOME/.bash-git-prompt/gitprompt.sh" ]; then
    GIT_PROMPT_ONLY_IN_REPO=1
    source "$HOME/.bash-git-prompt/gitprompt.sh"
fi
EOF

    tee -a "$HOME/.bashrc" << 'EOF'

cd () {
    builtin cd "$@" && ls --color=auto -A
}

_debian_age() {
    local born=""

    if [ -e /lost+found ]; then
        born=$(stat -c %Y /lost+found 2>/dev/null)
    elif [ -f /var/log/installer/syslog ]; then
        born=$(stat -c %Y /var/log/installer/syslog 2>/dev/null)
    fi

    if [ -n "$born" ]; then
        local now=$(date +%s)
        local seconds=$((now - born))
        local days=$((seconds / 86400))

        if [ "$days" -lt 7 ]; then
            local hours=$(((seconds % 86400) / 3600))
            local minutes=$(((seconds % 3600) / 60))
            echo "${days}d ${hours}h ${minutes}m"
        else
            echo "${days}d"
        fi
    else
        echo "unknown"
    fi
}

main_prompt() {
    local exit_code=$?

    local ok='\[\e[32m\]:)\[\e[m\]'
    local err='\[\e[31m\]:(\[\e[m\]'
    local smiley; [[ $exit_code -eq 0 ]] && smiley=$ok || smiley=$err

    PS1="[sys: \$(_debian_age)] ${smiley} \w\n> "
}

PROMPT_COMMAND=main_prompt
EOF

    git clone https://github.com/jgz365/homeguard.git "$HOME/homeguard"
    mkdir -p "$HOME/.config/{i3,i3status,ghostty,gtk-3.0,fastfetch,dunst,picom}"
    cp -r "$HOME/homeguard/.config/"* "$HOME/.config/"
    cp "$HOME/homeguard/.vimrc" "$HOME/"
    rm -rf "$HOME/homeguard"
}

sys_srv() {
    xdg-user-dirs-update
    echo "exec dbus-run-session i3" >> "$HOME/.xinitrc"
    systemctl --user enable pulseaudio.service
    sudo sed -i '/^[^#]/s/^/#/' /etc/network/interfaces
    sudo sed -i 's/managed=false/managed=true/' /etc/NetworkManager/NetworkManager.conf
}

as_root
[ "$INSTALL_NVIDIA" = true ] && nvidia
main_pkgs
outside_deb
font_pack
cursor_theme
git_repos
sys_srv

log "Done."
