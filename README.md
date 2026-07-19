## My personal set of configurations for linux-related stuff.

<table border="0">
  <tr>
    <td>
      <img src="./assets/sway_debian_image.png" width="100%" alt="sway_debian"/><br/>
      <b>SwayWM with Debian </b>
    </td>
    <td>
      <img src="./assets/gentoo_desktop.png" width="100%" alt="gentoo_desktop"/><br/>
      <b>i3wm with Gentoo</b>
    </td>
    <td>
      <img src="./assets/nix-gnome.png" width="100%" alt="nix_gnome"/><br/>
      <b>NixOS with GNOME</b>
    </td>
  </tr>
</table>

### I've listed some documentation or things that I have used on their respective folders. <br>
### Check here for [[epoch]](./epoch) and [[deborah]](./deborah)

## Repository Structure

```
.
├── assets
│   ├── demo.png
│   ├── desktop-i3.png
│   ├── gentoo_desktop.png
│   ├── mint_i3.png
│   ├── nix-gnome.png
│   └── sway_debian_image.png
├── deborah
│   ├── dunst
│   │   └── dunstrc
│   ├── fastfetch
│   │   ├── config.jsonc
│   │   └── system-age.sh
│   ├── flameshot
│   │   └── flameshot.ini
│   ├── flameshot.conf
│   ├── foot
│   │   └── foot.ini
│   ├── gtklock
│   │   ├── config.ini
│   │   └── style.css
│   ├── htop
│   │   └── htoprc
│   ├── i3
│   │   ├── config
│   │   └── scripts
│   │       └── powermenu.sh
│   ├── i3status
│   │   └── config
│   ├── neofetch
│   │   └── config.conf
│   ├── picom
│   │   └── picom.conf
│   ├── README.md
│   ├── swappy
│   │   └── config
│   ├── sway
│   │   ├── config
│   │   ├── nord_purple_waves.png
│   │   └── powermenu.sh
│   ├── tofi
│   │   └── config
│   ├── waybar
│   │   ├── config.jsonc
│   │   └── style.css
│   └── xfce4
│       └── xfconf
│           └── xfce-perchannel-xml
│               ├── thunar.xml
│               └── xfce4-terminal.xml
├── epoch
│   ├── bash
│   │   └── prompt
│   ├── dunst
│   │   └── dunstrc
│   ├── fastfetch
│   │   ├── config.jsonc
│   │   └── system-age.sh
│   ├── i3
│   │   ├── config
│   │   ├── ext
│   │   │   ├── 01_autoStart
│   │   │   ├── 02_keyBinds
│   │   │   ├── 03_windowRules
│   │   │   ├── 04_windowNav
│   │   │   └── 05_statusBar
│   │   └── gray.jpg
│   ├── i3status
│   │   └── config
│   ├── portage
│   │   ├── env
│   │   │   └── firefox.conf
│   │   ├── make.conf
│   │   ├── package.accept_keywords
│   │   │   ├── installkernel
│   │   │   └── zzz_autounmask
│   │   ├── package.env
│   │   ├── package.mask
│   │   │   ├── systemd
│   │   │   └── wayland
│   │   ├── package.use
│   │   │   ├── 00cpu-flags
│   │   │   ├── 00video_cards
│   │   │   ├── bluez
│   │   │   ├── cups
│   │   │   ├── discord
│   │   │   ├── fastfetch
│   │   │   ├── ffmpeg
│   │   │   ├── firefox
│   │   │   ├── gtk
│   │   │   ├── installkernel
│   │   │   ├── mpv
│   │   │   ├── networkmanager
│   │   │   ├── obs
│   │   │   ├── picom
│   │   │   ├── pinentry
│   │   │   ├── pipewire
│   │   │   ├── pulseaudio
│   │   │   ├── qtbase
│   │   │   ├── screenkey
│   │   │   ├── st
│   │   │   ├── systemd
│   │   │   ├── use.mask
│   │   │   ├── vim
│   │   │   └── wpa_supplicant
│   │   ├── profile
│   │   │   └── use.mask
│   │   └── repos.conf
│   │       └── eselect-repo.conf
│   ├── README.md
│   └── xob
│       └── styles.cfg
├── etc
│   └── sudoers
├── README.md
├── snowflake
│   ├── nixos
│   │   ├── bootloader-grub.nix
│   │   ├── boot-settings.nix
│   │   ├── config-sudo.nix
│   │   ├── configuration.nix
│   │   ├── default-settings.nix
│   │   └── system-user-packages.nix
│   └── README.md
├── unmaintained
│   ├── firefox-custom-css
│   │   └── userChrome.css
│   ├── helix-text-editor
│   │   ├── config.toml
│   │   └── languages.toml
│   └── starship-prompt-bash
│       └── starship.toml
└── wallpapers
    ├── garden.jpeg
    ├── gray.jpg
    ├── nix_dark.png
    └── tree.jpg
```

> The "unmaintained" folder is my archived folder, it hasn't been used for a while so they may or may not work.

Sources used:
- [i3-starterpack](https://github.com/addy-dclxvi/i3-starterpack)
- [C. Pissarro Artworks](https://www.wikiart.org/en/camille-pissarro)
- [Gentoo Wiki - i3wm](https://wiki.gentoo.org/wiki/I3)
- [Debian Packages](https://www.debian.org/distrib/packages)
- [NVIDIA Graphics Drivers](https://wiki.debian.org/NvidiaGraphicsDrivers)
- [This stackoverflow question](https://stackoverflow.com/questions/40986340/how-to-wget-a-list-of-urls-in-a-text-file)
- [CTT's Debian-titus script](https://github.com/ChrisTitusTech/Debian-titus/blob/main/install.sh)
- [Bash Git Prompt](https://github.com/magicmonty/bash-git-prompt)
- [Bash Syntax](https://www.w3schools.com/bash/bash_syntax.php)
- [Fastfetch](https://github.com/fastfetch-cli/fastfetch)
- [Arc-Theme](https://github.com/arc-design/arc-theme)
- [NixOS Official Wiki](https://wiki.nixos.org/wiki/NixOS_Wiki)
- [NixOS Packages](https://search.nixos.org/packages)
