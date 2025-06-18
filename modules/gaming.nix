# My games configuration in nix

{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    discord
    (bottles.override { removeWarningPopup = true; }) # Bottes for genshin
    protonup # Proton updated
  ];

  # gamemode: for optimizing games
  programs.gamemode.enable = true;

  # genshin workaround for os detection
  networking.extraHosts =
  ''
    0.0.0.0 log-upload-os.hoyoverse.com
    0.0.0.0 overseauspider.yuanshen.com
  '';
}
