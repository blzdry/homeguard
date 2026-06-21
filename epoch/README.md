# Epoch 
### Little nerdy fact - this was the original name of Gentoo Linux, thought I needed to share that one :P

> (incomplete, will update at some point)

Here is a table list of the packages I installed to setup i3wm.

### In Gentoo repository:

| Packages             | Do you need this?          |
| ------------------   | ------------------- | 
| app-admin/sudo | yes, can use doas for alternative |
| app-editors/vim | yes |
| app-eselect/eselect-repository | yes |
| app-misc/fastfetch | no |
| app-misc/jq | no |
| app-office/onlyoffice-bin | depends |
| app-portage/eix | yes |
| app-portage/gentoolkit | yes |
| app-shells/bash-completion | no |
| app-text/tree | no |
| dev-java/openjdk-bin:8 | no |
| dev-vcs/git | yes |
| lxde-base/lxappearance | yes |
| mail-client/thunderbird-bin | depends |
| media-fonts/fonts-meta | yes |
| media-fonts/corefonts | depends |
| media-fonts/noto | yes |
| media-fonts/noto-cjk | depends |
| media-fonts/noto-emoji | yes |
| media-gfx/blender | no |
| media-gfx/feh | yes |
| media-gfx/flameshot | yes |
| media-libs/libpulse | yes |
| media-sound/alsa-tools | yes |
| media-sound/alsa-utils | yes |
| media-sound/pulseaudio-daemon | yes |
| media-video/mpv | yes |
| media-video/obs-studio | yes |
| net-im/discord | no |
| net-misc/networkmanager | yes, easy setup for wifi on laptops |
| sys-apps/qingy | depends |
| sys-apps/xdg-desktop-portal | yes |
| sys-apps/xdg-desktop-portal-gtk | yes |
| sys-power/acpi | if using laptop, yes |
| sys-power/tlp | if using laptop, yes |
| sys-process/btop | yes |
| www-client/ungoogled-chromium | preference |
| x11-apps/xinit | yes |
| x11-misc/dunst | yes |
| x11-misc/i3lock | depends |
| x11-misc/i3status | yes |
| x11-misc/j4-dmenu-desktop | yes, can also use rofi or dmenu |
| x11-misc/pcmanfm | preference |
| x11-misc/picom | yes |
| x11-misc/screenkey | depends |
| x11-misc/xclip | yes |
| x11-misc/xdg-user-dirs | yes |
| x11-misc/xdg-utils | yes |
| x11-terms/xfce4-terminal | yes |
| x11-themes/arc-icon-theme | yes |
| x11-themes/arc-theme | yes |
| x11-wm/i3 | totally |

### In GURU:

| Packages                | Essential? |
| ----------------------- | ---------- |
| app-misc/brightnessctl | if using laptop, yes        |
| gui-apps/packettracer | no |
| x11-misc/xob            | if using laptop, yes   |
| sys-fs/duf              | no         |
 
# Optional - Packet Tracer
I would be about 99.5% sure that no one would even use this, in Gentoo. But apparently I do. Thanks to this [reddit thread](https://www.reddit.com/r/Gentoo/comments/1qk403f/how_to_get_packet_tracer_822_working_on_gentoo/).

### Requirements:
- [GURU](https://wiki.gentoo.org/wiki/Project:GURU)

Grab the archive:

```
wget https://archive.org/download/cpt822/CiscoPacketTracer822_amd64_signed.deb
```

Move onto `distfiles`:

```
sudo mv CiscoPacketTracer822_amd64_signed.deb /var/cache/distfiles/Packet_Tracer822_amd64_signed.deb
```

Accept keyword in `package.accept_keywords`:

```
echo "gui-apps/packettracer ~amd64" | sudo tee -a /etc/portage/package.accept_keywords/packettracer
```

Accept license in `package.license`:

```
echo "gui-apps/packettracer Cisco" | sudo tee /etc/portage/package.license/packettracer
```

Install:

```
sudo emerge -aq gui-apps/packettracer dev-qt/qtnetworkauth dev-libs/libxml2-compat
```

Ensure that libraries will work before launching:

```
export LD_LIBRARY_PATH="/opt/pt/bin:/usr/lib:${LD_LIBRARY_PATH}"
```

Link the program onto `/usr/local/bin`:

```
sudo ln -s /opt/pt/packettracer /usr/local/bin/
```

Upon login, click "Skills for All", for some reason I cannot login with the "Networking Academy" option
