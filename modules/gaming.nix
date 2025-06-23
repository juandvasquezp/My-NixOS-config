# My games configuration in nix

{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    discord
    mangohud
    (bottles.override { removeWarningPopup = true; }) # Bottes for genshin
    protonplus # Proton updated
    obs-studio # Obs # It should hav video acceleration
    lutris # See https://nixos.wiki/wiki/Lutris if missing depndencies
  ];

  #users.users.juan-david.packages = with pkgs; [
  #  # minecraft #Minecraft is marked as broken as of 2025/06/22, so I'll install it with flatpak instead
  #  # mcpelauncher-ui-qt # And this one gives errors
  #];

  # gamemode: for optimizing games
  programs.gamemode.enable = true;
  # gamescope: for minimal ui for games
  programs.gamescope.enable = true;

  # steam
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    # dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
    # localNetworkGameTransfers.openFirewall = true; # Open ports in the firewall for Steam Local Network Game Transfers
  };

  # genshin workaround for os detection
  networking.extraHosts =
  ''
    217.156.22.169 dispatchosglobal.yuanshen.com
  '';
}
