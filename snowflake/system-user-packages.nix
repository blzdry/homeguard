{ config, pkgs, ... }:

{
    users.users."blizzard" = {
    isNormalUser = true;
    description = "Jonathan";
    extraGroups = [ "networkmanager" "wheel" ];
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
    ];
  };

  fonts.packages = with pkgs; [
    nerd-fonts.martian-mono
    noto-fonts
    noto-fonts-color-emoji
    noto-fonts-cjk-sans
    noto-fonts-cjk-serif
  ];

  environment.gnome.excludePackages = with pkgs; [
    gnome-tour
  ];

  environment.systemPackages = with pkgs; [
    nautilus
    sushi
    ffmpeg-headless
    ffmpegthumbnailer
    vim
    papirus-icon-theme
    gnome-tweaks
    gnome-extension-manager
    git
    gh
    nodejs_24
    nix-direnv
  ];
}
