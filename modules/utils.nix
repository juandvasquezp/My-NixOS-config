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

    # Archiveste
    unar      #unrar free
    (pkgs.writeShellScriptBin "7z" ''
      exec ${pkgs._7zz}/bin/7zz "$@"
    '') # use 7zz as 7z

    # Appimages
    appimage-run
  ];
  # enable appimage support
  programs.appimage.enable = true;
  programs.appimage.binfmt = true;

  users.users.juan-david.packages = with pkgs; [
    tor-browser   # Recommended in home manager TODO
    vdhcoapp
  ];

  # SSH
  services.openssh = {
    enable = true;
    settings = {
      PasswordAuthentication = true;
      # UseDns = true;
    };
  };
  programs.ssh.startAgent = true;
  # security.pam.services.juan-david.kwallet.enable = true;

  # GNUPG
  programs.gnupg.agent = {
    enable = true;
    pinentryPackage = pkgs.pinentry-qt;
  };

  programs.mosh.enable = true;

  # Firefox testing
  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-wlr
      xdg-desktop-portal-gtk
    ];
  };
}
