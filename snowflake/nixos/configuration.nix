{ config, pkgs, ... }:

{
  imports =
    [ 
      /etc/nixos/hardware-configuration.nix
      ./bootloader-grub.nix
      ./boot-settings.nix
      ./default-settings.nix
      ./system-user-packages.nix
      ./config-sudo.nix
    ];

}
