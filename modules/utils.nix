# Adirional sofware from all kinds

{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # Obsidian
    obsidian
    # bitwarden
    bitwarden-desktop
    # Kdenlive: video editor
    kdePackages.kdenlive
    # Vlc: media player
    vlc
    # gimp
    gimp
    # Libreoffice
    libreoffice-qt
    # Libreoffice languages
    hunspell
    hunspellDicts.es_CO
    hunspellDicts.en_US
    # Wine
    wineWowPackages.stableFull
    winetricks
    wineWowPackages.waylandFull
  ];

  # Firefox testing
  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-wlr
      xdg-desktop-portal-gtk
    ];
  };
}
