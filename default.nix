{ pkgs, ... }:

let
  USER = "raf";
in
{
  services = {
    xserver.enable = true;
    desktopManager.plasma6.enable = true;
    displayManager.enable = true;
    displayManager.sddm.enable = true;
    displayManager.sddm.wayland.enable = true;
  };

  programs.dconf.enable = true;
  programs.partition-manager.enable = true;

  home-manager.users.${USER} = {
    home.packages = with pkgs; [
      nur.repos.wolfangaukang.mouseless
      kitty
      konsave
      kde-gtk-config
      unstable.polonium
    ];
  };
}
