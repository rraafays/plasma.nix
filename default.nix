{ pkgs, ... }:

let
  USER = "raf";

  plasma = {
    command = "${pkgs.plasma-workspace}/bin/startplasma-wayland";
    user = USER;
  };
in
{
  services = {
    xserver.enable = true;
    desktopManager.plasma6.enable = true;
  };

  services.greetd = {
    enable = true;
    settings = {
      initial_session = plasma;
      default_session = plasma;
    };
  };

  home-manager.users.${USER} = {
    systemd.user.services.mouseless = {
      Unit = {
        Description = "mouseless";
      };
      Install = {
        WantedBy = [ "default.target" ];
      };
      Service = {
        ExecStart = "${pkgs.writeShellScript "mouseless" ''
          #!/run/current-system/sw/bin/bash
          ${pkgs.nur.repos.wolfangaukang.mouseless}/bin/mouseless --config ~/.config/mouseless/config.yaml
        ''}";
      };
    };

    home.packages = with pkgs; [
      nur.repos.wolfangaukang.mouseless
      kitty
    ];
  };
}
