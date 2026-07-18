{ config, pkgs,... }:

{
    security.sudo = {
        enable = true;
        extraConfig = ''
          Defaults    timestamp_timeout=5
          Defaults    rootpw
          Defaults    env_reset,pwfeedback
          Defaults    insults
          Defaults    passprompt="Enter your password, boy: "
        '';
  };

}
