# Deborah

### Nerdy fact - Debian is a portmanteau of the first name of its creator - Ian, and his wife Deborah.

> (incomplete, will add more at some point)

Here is the table list for the packages/tools/utilities that I use.

>[!WARNING]
> Hyperlinked packages are ***not*** in the debian repos, you will need to download their *.deb*, or through the tarball. Know your risks when downloading third-party applications as these are not maintained by Debian.

| Package | What for? | Needed? |
| ------- | --------- | ------- |
| acpi | Battery Information | Yes, for laptops |
| adb | Android Debug Bridge | Depends on your use case |
| alsa-utils | Audio | Yes |
| [android-studio](https://developer.android.com/studio/install) | Android Development | No, personal use |
| aptitude | Package Management | No, but recommended for safer system upgrades |
| arc-theme | Icon Theme | Yes |
| [brave-origin](https://brave.com/origin/) | Web Browsing | No, Firefox and Chromium are some of the alternatives |
| brightnessctl | Brightness Control | Yes, for laptops |
| build-essential | Development Package Set | No, unless doing development (e.g compiling, programming) |
| [packettracer](https://www.netacad.com/cisco-packet-tracer) | Networking | No, personal use (requires account) |
| [discord](https://discord.com/) | Internet Messaging | No |
| duf | Disk Usage Utility | Optional |
| fasfetch | Display System Information | No |
| ffmpegthumbnailer | Video Thumbnail Preview (for file managers) | Yes |
| flatpak | Sanboxed Applications | No |
| foot | Terminal Emulator | Yes |
| git | Version Control System | Yes |
| grim | Screenshot Utility | Yes |
| grimshot | Screenshot Utility | Yes |
| gtklock | Lock Screen | Optional |
| htop | System Monitor | Yes |
| [localsend](https://localsend.org/) | Share files through Wi-Fi | Yes |
| mpv | Video Player | Yes |
| mupdf | PDF Viewer | Yes |
| nwg-look | GTK Settings | Yes |
| obs-tudio | Screen Recorder | Yes |
| pipewire | Sound Server | Yes |
| pipewire-pulse | Compatibility layer for PulseAudio | Yes |
| powertop | Observe battery usage | Optional |
| preload | Pre-load applications that you might frequently use | Yes, for HDDs |
| screenkey | Record key inputs on your screen | Optional |
| slurp | Screenshot Utility | Yes |
| swappy | Screenshot Utility with simple image manipulation | Yes |
| sway | Tiling Window Manager | Yes |
| swaybg | Set desktop wallpaper | Yes |
| swayimg | View images from file manager | Yes |
| thunar | File Manager | Yes |
| thunar-volman | Detect mounted drives | Yes |
| thunderbird | Mailing App | Yes |
| tlp | Battery Management | Yes, if using laptop |
| tofi | Application Launcher | Yes |
| tree | List file hierarchy | No |
| unzip | File Utility | Yes |
| vim | Text Editor | Yes |
| waybar | Status Bar | Yes |
| wayland-protocol |  Communication Protocol | Yes |
| wireplumber | Sound Server | Yes |
| wl-clipboard | Copy and Pasting Utility | Yes |
| xdg-desktop-portal*(gtk,wlr) | Portals for Applications | Yes |
| xdg-utils | App Integration for Desktop | Yes |
| xwayland | Allow programs running through X11 | Optional |
| zram-tools | Userspace tools | Recommended |

| Font Packs |
| ---------- |
| fonts-font-awesome |
| fonts-freefont-ttf |
| fonts-liberation |
| fonts-noto |
| fonts-noto-cjk |
| fonts-noto-cjk-extra |
| fonts-noto-color-emoji |
| fonts-noto-extra |
| ttf-mscorefonts-installer |

Helpful stuff:

1. [Bash Git Prompt](https://github.com/magicmonty/bash-git-prompt)
   - If you use git, and if you use terminal, and if you *also* use bash, this might be helpful for you.
2. [Nerd Fonts](https://www.nerdfonts.com/font-downloads)
   - Prettier fonts, also supports icons in terminal for aesthetic.
  
# Optional : NVIDIA as the primary GPU

Assuming that the NVIDIA Driver is installed/supported, this can be done. 

### If using nouveau, this will not work.

There's a little workaround to do for this to work. <br>
If by any chance you *want* to make this happen, [here's how](https://wiki.debian.org/NVIDIA%20Optimus#Using_NVIDIA_GPU_as_the_primary_GPU):

1. Paste the following in `/etc/X11/xorg.conf` (make sure to install x11-xserver-utils)
```
Section "ServerLayout"
    Identifier "layout"
    Screen 0 "nvidia"
    Inactive "intel"
EndSection

Section "Device"
    Identifier "nvidia"
    Driver "nvidia"
    BusID "PCI:x:x:x"
EndSection

Section "Screen"
    Identifier "nvidia"
    Device "nvidia"
    Option "AllowEmptyInitialConfiguration"
EndSection

Section "Device"
    Identifier "intel"
    Driver "modesetting"
    BusID "PCI:x:x:x"
EndSection

Section "Screen"
    Identifier "intel"
    Device "intel"
EndSection
```
2. `PCI:x:x:x` consists of three numbers. Get the output from `lspci`. Since this is Optimus, it uses Intel x NVIDIA. Note of the following:

`00:02.0 VGA compatible controller: Intel Corporation Haswell-ULT Integrated Graphics Controller (rev 09)`

This is Intel's Graphics. `00:02.0` is translated to `PCI:0:2:0`.

`04:00.0 3D controller: NVIDIA Corporation GM108M [GeForce 840M] (rev a2)`

This is NVIDIA's Graphics. `04:00.0` is translated to `PCI:4:0:0`.

> [!NOTE]
> This can differ depending on your hardware. This is only a sample from my system.

3. Place the following in `~/.xinitrc`:

> This is where things are different, as per the Wiki, you are recommended to put this in `~/.xsessionrc`, upon trying this method, i3wm refuses to launch.

The order in here ***MATTERS***, if you try adding `exec dbus-run-session i3` on top, i3wm will not launch.

```
xrandr --setprovideroutputsource modesetting NVIDIA-0
xrandr --auto
xrandr --dpi 96
exec dbus-run-session i3
```

4. Specify PrimaryGPU to be NVIDIA, paste in `/etc/X11/xorg.conf.d/nvidia_as_primary.conf`
```
Section "OutputClass"
    Identifier "nvidia"
    MatchDriver "nvidia-drm"
    Driver "nvidia"
    Option "PrimaryGPU" "yes"
EndSection
```

5. In `/etc/default/grub`, add the following in `GRUB_CMDLINE_LINUX_DEFAULT`:
```
nvidia-drm.modeset=1
```
6. Rebuild the configuration with `sudo update-grub`

### Optional: PRIME Sync over picom

Instead of picom handling screen tearing, you can use PRIME's VSync instead. 
> saves you about 1 package less, nothing special really.

1. Add at the *very bottom of `/etc/modprobe.d/nvidia.conf`:
```
options nvidia-drm modeset=1
```

2. Regenerate your initramfs:
```
# update-initramfs -u
```

Reboot, then invoke `startx`. i3wm should launch.<br>