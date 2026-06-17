# Deborah

### Nerdy fact - Debian is a portmanteau of the first name of its creator - Ian, and his wife Deborah.

> (incomplete, will add more at some point)

Here is the table list for the packages/tools/utilities that I use, sorted with package name and whether it is essential.

| Package Name | Essential? | 
| ------------ | ---------- | 
| gcc          | yes        | 
| curl         | depends    |
| git          | yes        |
| vim          | preference |
| tmux         | depends    |
| ttf-mscorefonts-installer | recommended for better office-suit font support |
| fonts-noto | yes |
| fonts-noto-cjk | yes |
| fonts-noto-cjk-extra | yes |
| fonts-noto-color-emoji | yes |
| fonts-noto-core | yes |
| i3 | totally
| i3status | yes |
| i3lock | depends |
| j4-dmenu-desktop | yes, but can use rofi or standard dmenu |
| picom | yes |
| dunst | yes |
| feh | if using wallpaper |
| brightnessctl | yes, if using laptop |
| xinit | depends |
| alsa-utils | yes |
| pavucontrol | optional |
| lxappearance | yes |
| arc-theme | yes |
| papirus-icon-theme | yes |
| unzip | yes |
| lxpolkit | optional |
| mousepad | yes |
| flameshot | yes |
| xclip | yes |
| 7zip | yes |
| obs-studio | yes |
| thunar | yes |
| pulseaudio | yes |
| network-manager | recommended for easier setup |
| redshift | optional |
| mpv | yes, can also use vlc |
| xfce4-terminal | yes |
| btop | yes |

# Brave Origin

Whether you'd install from outside of the Debian repository is up to you. Chromium and Firefox-ESR are two of the known browsers that exists in the debian repository.

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