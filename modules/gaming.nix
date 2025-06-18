# My games configuration in nix

{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    discord
    (bottles.override { removeWarningPopup = true; }) # Bottes for genshin
    protonup # Proton updated
    obs-studio # Obs # It should hav video acceleration
    lutris # See https://nixos.wiki/wiki/Lutris if missing depndencies
  ];

  # gamemode: for optimizing games
  programs.gamemode.enable = true;

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
    0.0.0.0 log-upload-os.hoyoverse.com
    0.0.0.0 overseauspider.yuanshen.com
  '';
}
