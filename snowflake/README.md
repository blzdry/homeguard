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
| config-sudo.nix | Optional settings for Sudo |
| configuration.nix | Main file that sources every *.nix files |
| default-settings.nix | System-wide configuration settings |
| flake.lock | Freeze the current system version, only upgradable if invoked by user (me) |
| flake.nix | Flake declaration file |
| system-user-packages.nix | Organized packages for user, and for system |
