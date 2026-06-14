## My personal set of configurations for linux-related stuff.

![description](assets/mint_i3.png)

### Programs that I use:

- [Brave Origin](https://brave.com/origin/)
  > Free on Linux
- Cinnamon's Terminal
- i3status with [window title](https://github.com/rholder/i3status-title-on-bar)
- [Flameshot](https://flameshot.org/) - screenshot tool, flexible
- [Iosevka](https://www.nerdfonts.com/font-downloads) - nerd font for terminal and i3status
- [j4-dmenu-desktop](https://github.com/enkore/j4-dmenu-desktop) - better dmenu for app launcher
- *B*ourne *A*gain *Sh*ell - with custom prompt

  This theme heavily uses the [Arc Theme](https://github.com/arc-design/arc-theme), same goes to the terminal theme.
  
> The "unmaintained" folder is my archived folder, it hasn't been used for a while so they may or may not work. They are not included in the script.

### I discarded my install script as it is cumbersome to try integrate more and more stuff, eventually leading to confusion and possibly endless bugs that I can never imagine. Maybe in time if there's a better use-case for it.

## Originally, I used Debian, but I've switched to Mint. In fact, some tasks I used to perform are now fewer thanks to Mint's OOTB experience.

> which is basically the NVIDIA drivers, graphics switching, themes, etc.

# Using NVIDIA as the Primary GPU (only if using Debian)
> i3 still shows the prime-applet on the tray, and switching graphics still works regardless of what you use. (Cinnamon or i3wm)

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
If by any chance you have or use a login manager, follow the [wiki](https://wiki.debian.org/NVIDIA%20Optimus#Display_managers) for more instructions.

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
