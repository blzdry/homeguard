{ config, pkgs, ... }:

{

    nix.settings.experimental-features = [ "nix-command" "flakes" ];

  services.libinput.enable = false;
  services.printing.enable = false;
  services.displayManager.gdm.enable = true;
  services.desktopManager.gnome.enable = true;
  services.gnome.core-apps.enable = false;
  environment.pathsToLink = [ "share/thumbnailers" ];
  services.xserver.excludePackages = [ pkgs.xterm ];
  programs.firefox.enable = false;
  programs.nano.enable = false;
  programs.direnv.enable = true;
  programs.direnv.nix-direnv.enable = true;
  environment.variables.EDITOR = "vim";
  nixpkgs.config.allowUnfree = true;
  
  networking.hostName = "elderhailstorm";
  # networking.wireless.enable = true;  
  # services.openssh.enable = true;

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  networking.networkmanager.enable = true;
  time.timeZone = "Asia/Manila";

  i18n.defaultLocale = "en_PH.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_PH.UTF-8";
    LC_IDENTIFICATION = "en_PH.UTF-8";
    LC_MEASUREMENT = "en_PH.UTF-8";
    LC_MONETARY = "en_PH.UTF-8";
    LC_NAME = "en_PH.UTF-8";
    LC_NUMERIC = "en_PH.UTF-8";
    LC_PAPER = "en_PH.UTF-8";
    LC_TELEPHONE = "en_PH.UTF-8";
    LC_TIME = "en_PH.UTF-8";
  };

  programs.git = {
    enable = true;
    config = {
      credential = {
        helper = "${pkgs.gh}/bin/gh auth git-credential";
       };
      };
    };

  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    #jack.enable = true;
};

  system.stateVersion = "26.05";
}
