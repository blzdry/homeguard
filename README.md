## My personal set of configurations for linux-related stuff.

### I've listed some documentation or things that I have used on their respective folders. <br>
### Check here for:
- [[epoch]](./epoch)
- [[deborah]](./deborah)
- [[snowflake]](./snowflake)

## Repository Structure

<details>
    <summary> Shortened to drop-down as the hierarchy itself is too long </summary>

```
homeguard/
├── arch
│   ├── alacritty
│   │   └── alacritty.toml
│   ├── dunst
│   │   └── dunstrc
│   ├── flameshot
│   │   └── flameshot.ini
│   ├── i3
│   │   ├── archlinux.jpg
│   │   ├── c-and-wilbur.png
│   │   ├── c-fetch.png
│   │   ├── config
│   │   ├── c-wars.png
│   │   ├── scripts
│   │   │   └── powermenu.sh
│   │   ├── sources
│   │   │   ├── 001_autoStart
│   │   │   ├── 002_keyBinds
│   │   │   ├── 003_windowRules
│   │   │   ├── 004_statusBar
│   │   │   └── 005_scriptStart
│   │   └── stamp-blue.jpeg
│   ├── i3status
│   │   ├── config
│   │   └── config.battery
│   ├── picom
│   │   └── picom.conf
│   └── psd
│       └── psd.conf
├── assets
│   ├── demo.png
│   ├── desktop-i3.png
│   ├── gentoo_desktop.png
│   ├── mint_i3.png
│   ├── nix-gnome.png
│   ├── nix-mac.png
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
│   ├── chrome
│   │   └── userChrome.css
│   ├── GIMP
│   │   └── 3.2
│   │       ├── action-history
│   │       ├── colorrc
│   │       ├── contextrc
│   │       ├── controllerrc
│   │       ├── devicerc
│   │       ├── dockrc
│   │       ├── extensionrc
│   │       ├── filters
│   │       │   └── GimpBrightnessContrastConfig.settings
│   │       ├── gimprc
│   │       ├── internal-data
│   │       │   └── custom.ggr
│   │       ├── modifiersrc
│   │       ├── parasiterc
│   │       ├── pluginrc
│   │       ├── plug-in-settings
│   │       │   ├── GimpProcedureConfigRun-file-jpeg-export.last
│   │       │   ├── GimpProcedureConfigRun-file-jpeg-load.last
│   │       │   ├── GimpProcedureConfigRun-file-png-export.last
│   │       │   ├── GimpProcedureConfigRun-file-png-load.last
│   │       │   ├── GimpProcedureConfigRun-file-svg-load.last
│   │       │   └── GimpProcedureConfigRun-plug-in-unit-editor.last
│   │       ├── profilerc
│   │       ├── sessionrc
│   │       ├── shortcutsrc
│   │       ├── splashes
│   │       │   └── splash-screen-2025-v2.png
│   │       ├── tags.xml
│   │       ├── templaterc
│   │       ├── theme.css
│   │       ├── tool-options
│   │       │   ├── gimp-airbrush-tool
│   │       │   ├── gimp-align-tool
│   │       │   ├── gimp-brightness-contrast-tool
│   │       │   ├── gimp-bucket-fill-tool
│   │       │   ├── gimp-by-color-select-tool
│   │       │   ├── gimp-cage-tool
│   │       │   ├── gimp-clone-tool
│   │       │   ├── gimp-color-picker-tool
│   │       │   ├── gimp-convolve-tool
│   │       │   ├── gimp-crop-tool
│   │       │   ├── gimp-curves-tool
│   │       │   ├── gimp-dodge-burn-tool
│   │       │   ├── gimp-ellipse-select-tool
│   │       │   ├── gimp-eraser-tool
│   │       │   ├── gimp-flip-tool
│   │       │   ├── gimp-foreground-select-tool
│   │       │   ├── gimp-free-select-tool
│   │       │   ├── gimp-fuzzy-select-tool
│   │       │   ├── gimp-gegl-tool
│   │       │   ├── gimp-gradient-tool
│   │       │   ├── gimp-handle-transform-tool
│   │       │   ├── gimp-heal-tool
│   │       │   ├── gimp-ink-tool
│   │       │   ├── gimp-iscissors-tool
│   │       │   ├── gimp-levels-tool
│   │       │   ├── gimp-measure-tool
│   │       │   ├── gimp-move-tool
│   │       │   ├── gimp-mypaint-brush-tool
│   │       │   ├── gimp-offset-tool
│   │       │   ├── gimp-operation-tool
│   │       │   ├── gimp-paintbrush-tool
│   │       │   ├── gimp-path-tool
│   │       │   ├── gimp-pencil-tool
│   │       │   ├── gimp-perspective-clone-tool
│   │       │   ├── gimp-perspective-tool
│   │       │   ├── gimp-rect-select-tool
│   │       │   ├── gimp-rotate-tool
│   │       │   ├── gimp-scale-tool
│   │       │   ├── gimp-shear-tool
│   │       │   ├── gimp-smudge-tool
│   │       │   ├── gimp-text-tool
│   │       │   ├── gimp-threshold-tool
│   │       │   ├── gimp-transform-3d-tool
│   │       │   ├── gimp-unified-transform-tool
│   │       │   ├── gimp-vector-tool
│   │       │   ├── gimp-warp-tool
│   │       │   └── gimp-zoom-tool
│   │       ├── toolrc
│   │       └── unitrc
│   ├── nvim
│   │   ├── init.lua
│   │   └── lazy-lock.json
│   ├── sudoers
│   └── vite-website
│       └── my-website-profile
│           ├── eslint.config.js
│           ├── index.html
│           ├── package.json
│           ├── package-lock.json
│           ├── public
│           │   ├── favicon.svg
│           │   └── icons.svg
│           ├── README.md
│           ├── src
│           │   ├── App.css
│           │   ├── App.jsx
│           │   ├── assets
│           │   │   ├── hero.png
│           │   │   ├── jpg.jpg
│           │   │   ├── react.svg
│           │   │   └── vite.svg
│           │   ├── components
│           │   │   ├── footerbar.jsx
│           │   │   ├── loginmodal.jsx
│           │   │   ├── navbar.jsx
│           │   │   └── studentcard.jsx
│           │   ├── index.css
│           │   └── main.jsx
│           └── vite.config.js
├── README.md
├── snowflake
│   ├── nixos
│   │   ├── bootloader-grub.nix
│   │   ├── boot-settings.nix
│   │   ├── config-sudo.nix
│   │   ├── configuration.nix
│   │   ├── default-settings.nix
│   │   ├── flake.lock
│   │   ├── flake.nix
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
</details>

> The "unmaintained" folder is my archived folder, it hasn't been used for a while so they may or may not work.

Sources used:
- [i3-starterpack](https://github.com/addy-dclxvi/i3-starterpack)
- [C. Pissarro Artworks](https://www.wikiart.org/en/camille-pissarro)
- [Gentoo Wiki - i3wm](https://wiki.gentoo.org/wiki/I3)
- [Debian Packages](https://www.debian.org/distrib/packages)
- [NVIDIA Graphics Drivers](https://wiki.debian.org/NvidiaGraphicsDrivers)
- [This stackoverflow question](https://stackoverflow.com/questions/40986340/how-to-wget-a-list-of-urls-in-a-text-file)
- [Bash Git Prompt](https://github.com/magicmonty/bash-git-prompt)
- [Bash Syntax](https://www.w3schools.com/bash/bash_syntax.php)
- [Fastfetch](https://github.com/fastfetch-cli/fastfetch)
- [Arc-Theme](https://github.com/arc-design/arc-theme)
- [NixOS Official Wiki](https://wiki.nixos.org/wiki/NixOS_Wiki)
- [NixOS Packages](https://search.nixos.org/packages)
- [MD Cheat Sheet](https://github.com/leighTOR/md-cheatsheet)
- [Arch Linux Wiki](https://wiki.archlinux.org/title/Main_page)
