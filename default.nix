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
      handbrake
      kdePackages.filelight
      kdePackages.k3b
      konsave
      krita
      nur.repos.wolfangaukang.mouseless
      unstable.polonium
    ];
  };
  environment.systemPackages = with pkgs; [
    application-title-bar
    capitaine-cursors-themed
    clinfo
    glxinfo
    kde-gruvbox
    kde-rounded-corners
    kdePackages.bluedevil
    kdePackages.kaccounts-integration
    kdePackages.kaccounts-providers
    kdePackages.kcmutils
    kdePackages.kio-gdrive
    kdePackages.oxygen-sounds
    kdePackages.plasma-thunderbolt
    kdePackages.plymouth-kcm
    kdePackages.sddm-kcm
    kdePackages.signond
    libsForQt5.qoauth
    plasma-applet-commandoutput
    plasma-panel-colorizer
    unstable.kde-gtk-config
    vulkan-tools
    wayland-utils
    where-is-my-sddm-theme
  ];
}
