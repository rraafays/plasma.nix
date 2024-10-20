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
      fswebcam
      handbrake
      kde-gtk-config
      kdePackages.filelight
      kdePackages.k3b
      kdePackages.kcalc
      kdePackages.plasma-thunderbolt
      kdePackages.plymouth-kcm
      kdePackages.sddm-kcm
      kitty
      konsave
      krita
      lunacy
      nur.repos.wolfangaukang.mouseless
      soulseekqt
      unstable.polonium
    ];
  };
}
