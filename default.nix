{ pkgs, ... }:

let
  USER = "raf";
in
{
  services = {
    xserver.enable = true;
    desktopManager.plasma6.enable = true;
    displayManager = {
      hiddenUsers = [ "restic" ];
      enable = true;
      ly.enable = true;
    };
  };

  programs = {
    dconf.enable = true;
    partition-manager.enable = true;
  };

  environment = {
    systemPackages = with pkgs; [
      application-title-bar
      capitaine-cursors-themed
      clinfo
      glxinfo
      kde-gruvbox
      kde-rounded-corners
      kdePackages.bluedevil
      kdePackages.filelight
      kdePackages.k3b
      kdePackages.kaccounts-integration
      kdePackages.kaccounts-providers
      kdePackages.kcmutils
      kdePackages.kde-gtk-config
      kdePackages.kio-gdrive
      kdePackages.oxygen-sounds
      kdePackages.plasma-thunderbolt
      kdePackages.plymouth-kcm
      kdePackages.signond
      konsave
      krita
      libsForQt5.qoauth
      nur.repos.wolfangaukang.mouseless
      plasma-applet-commandoutput
      plasma-panel-colorizer
      polonium
      vulkan-tools
      wayland-utils
    ];

    plasma6.excludePackages = with pkgs.kdePackages; [
      elisa
      kwallet
      kwallet-pam
      kwalletmanager
      ksshaskpass
    ];
  };

  security.pam.services.sddm.enableKwallet = false;
}
