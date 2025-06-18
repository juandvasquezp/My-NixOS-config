# To make a full kde experience

{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    kdePackages.discover # store
  ];

  # kde-connect
  programs.kdeconnect.enable = true;
}
