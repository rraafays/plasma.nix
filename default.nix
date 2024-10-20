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
      kdePackages.filelight
      kdePackages.k3b
      kdePackages.kcalc
      kdePackages.taglib
      kitty
      konsave
      krita
      lunacy
      nur.repos.wolfangaukang.mouseless
      soulseekqt
      unstable.polonium
    ];
  };
  environment.systemPackages = with pkgs; [
    kde-gtk-config
    kdePackages.kcmutils
    kdePackages.plasma-firewall
    kdePackages.plasma-thunderbolt
    kdePackages.plymouth-kcm
    kdePackages.sddm-kcm
  ];
}
