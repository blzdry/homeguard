# Epoch 
### Little nerdy fact - this was the original name of Gentoo Linux, thought I needed to share that one :P

> (incomplete, will update at some point)

Here is a table list of the packages I installed to setup i3wm, sorted as the package name, is essential, and lastly if it's in [GURU](https://wiki.gentoo.org/wiki/Project:GURU).

### In Gentoo repository:

| Packages             | Essential?          |
| ------------------   | ------------------- | 
| x11-base/xorg-server | yes                 | 
| x11-base/xorg-driver | yes                 | 
| media-fonts/noto     | recommended         | 
| media-fonts/fonts-meta | recommended       | 
| media-fonts/noto-cjk | recommended         | 
| media-fonts/corefonts | optional           |
| x11-wm/i3            | totally             | 
| x11-wm/i3lock        | optional            | 
| x11-wm/i3status      | yes                 | 
| sys-power/acpi       | if using laptop     | 
| x11-terms/xfce4-terminal | can use other terminal |
| dev-python/watchdog  | if using xob, yes   | 
| media-sound/pulseaudio-daemon | yes        | 
| media-sound/alsa-utils | yes               | 
| media-sound/alsa-tools | depends           | 

### In GURU:

| Packages                | Essential? |
| ----------------------- | ---------- |
| x11-misc/xob            | optional   |
| sys-fs/duf              | no         |
| sys-power/brightnessctl | yes        | 

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