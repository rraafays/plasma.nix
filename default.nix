{ pkgs, ... }:

let
  USER = "raf";
in
{
  services = {
    xserver.enable = true;
    desktopManager.plasma6.enable = true;
    displayManager = {
      enable = true;
      sddm = {
        enable = true;
        wayland.enable = true;
      };
    };
  };

  programs = {
    dconf.enable = true;
    partition-manager.enable = true;
  };

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
    kde-rounded-corners
    kdePackages.bluedevil
    kdePackages.kaccounts-integration
    kdePackages.kaccounts-providers
    kdePackages.kcmutils
    kdePackages.kio-gdrive
    kdePackages.plasma-thunderbolt
    kdePackages.plymouth-kcm
    kdePackages.sddm-kcm
    kdePackages.signond
    libsForQt5.qoauth
    unstable.kde-gtk-config
  ];
}
