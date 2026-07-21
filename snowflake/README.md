# NixOS 26.05 (Yarara)

### I still do not have any flakes, nor home-manager set in here. Maybe in the future once I got the balls to go for it.

### For now, this is just a barebones configuration of my system.

# File Structure

```
├── nixos
│   ├── bootloader-grub.nix
│   ├── boot-settings.nix
│   ├── config-sudo.nix
│   ├── configuration.nix
│   ├── default-settings.nix
│   └── system-user-packages.nix
└── README.md
```

`bootloader-grub.nix` contains my settings for the bootloader that uses GRUB, instead of the default `systemd-boot`.

`boot-settings.nix` contains the boot options that are linked to GRUB, this also includes Plymouth enabled for smooth boot transition.

`config-sudo.nix` is an optional file. Usually just for aesthetic purposes, additional options.

`configuration.nix` - the main file for Nix generation. This should *NOT* be deleted.

`default-settings.nix` - configuration file for default settings that can be set globally.

`system-user-packages.nix` - package lists, either for system or for user. Organized for better readability.
