{ config, pkgs, ... }:

{
    users.users."blizzard" = {
    isNormalUser = true;
    description = "Jael Patajo Gonzal";
    extraGroups = [ "networkmanager" "wheel" "libvirtd" ];
    packages = with pkgs; [
    brave
    obs-studio
    vscode-fhs
    mpv
    android-studio
    whitesur-gtk-theme
    whitesur-icon-theme
    fastfetch
    ghostty
    mousepad
    localsend
    onlyoffice-desktopeditors
    ];
  };

  fonts.packages = with pkgs; [
    nerd-fonts.martian-mono
    noto-fonts
    noto-fonts-color-emoji
    noto-fonts-cjk-sans
    noto-fonts-cjk-serif
    inter
  ];

  environment.gnome.excludePackages = with pkgs; [
    gnome-tour
  ];

  environment.systemPackages = with pkgs; [
    eog
    nautilus
    sushi
    ffmpeg-headless
    ffmpegthumbnailer
    vim
    bat
    tree
    btop
    papirus-icon-theme
    gnome-tweaks
    gnome-extension-manager
    gitFull
    gh
    nodejs_24
    nix-direnv
  ];
}
