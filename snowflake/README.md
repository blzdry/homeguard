# NixOS 26.05 (Yarara)

### File Structure

```
.
├── nixos
│   ├── bootloader-grub.nix
│   ├── boot-settings.nix
│   ├── config-sudo.nix
│   ├── configuration.nix
│   ├── default-settings.nix
│   ├── flake.lock
│   ├── flake.nix
│   └── system-user-packages.nix
└── README.md
```

| File Name | Contents |
| --------- | -------- |
| bootloader-grub.nix | GRUB and some other settings, disabled systemd-boot (mostly preference) |
| boot-settings.nix | Plymouth, Kernel Parameters |
| config-sudo.nix | Optional settings for sudo |
| configuration.nix | Main file that sources every *.nix files |
| default-settings.nix | System-wide configuration settings |
| flake.lock | Freeze the current system version, only upgradable if invoked by user (me) |
| flake.nix | Flake declaration file |
| system-user-packages.nix | Organized packages for user, and for system |

> [!NOTE]
> This package set is mostly tailored at GNOME, especially some of the packages in System Package.

| User Package | Description | Would you need this? | 
| --- | --- | --- | 
| brave | Browse the internet | Optional, can use other browsers | 
| obs-studio | Screen-recording utility | Optional | 
| vscode-fhs | Text Editor with powerful extensions | No | 
| mpv | Video Player | Optional | 
| android-studio | IDE for Android | No |
| whitesur-gtk-theme | MacOS-like theme for GTK | No |
| whitesur-icon-theme | MacOS icons | No |
| fastfetch | System information | Maybe |
| ghostty | Terminal Emulator | Optional, can use other terminal emulators |
| mousepad | Simple text editor | Not really |
| localsend | Share files through network | Recommended |
| onlyoffice-desktopeditors | Office Suite | Maybe |
| blender | 3D Software | Probably not |
| cisco-packet-tracer_9 | Networking Simulation | I hope not |
| jetbrains.rust-rover | IDE for the Rust Programming Language | No |


| System Package | Description | Would you need this? | 
| --- | --- | --- | 
| eog | Image Viewer | Yes |
| nautilus | File Manager | Yes |
| sushi | Nautilus Dependency | Yes |
| ffmpeg-headless | Library | Maybe |
| ffmpegthumbnailer | Thumbnails for Video, Image | Yes |
| vim | Optional |
| bat | Upgraded version of cat command | Recommended |
| tree | List file hierarchy | Maybe |
| btop | Monitor system resources | Maybe |
| gnome-tweaks | Change GNOME's appearance | Recommended |
| gnome-extension-manager | Add extensions for GNOME | Recommended |
| gitFull | Git full package set | Maybe |
| gh | Authenticate Git on terminal | Not really, but quite helpful |
| nodejs_24 | Node Runtime Environment | No |
| nix-direnv | Project development setup | Could be |
| rustc | Rust tool | Only for RustRover |
| cargo | Rust tool | Only for RustRover |
| rust-analyzer | Rust tool | Only for RustRover |
| rustfmt | Rust tool | Only for RustRover |
| clippy | Rust tool | Only for RustRover |

| Fonts |
| --- |
| nerd-fonts.martian-mono |
| noto-fonts |
| noto-fonts-color-emoji |
| noto-fonts-cjk-sans |
| noto-fonts-cjk-serif |
| inter |
