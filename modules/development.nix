# Development tools that I use
# Docker is installed in virtualization

{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # git
    # git-lfs
    vscode
    arduino-ide
    dbeaver-bin
    wireshark
  ];

  programs.wireshark.enable = true;
  # vscode can be customized with nix TODO

  # git
  programs.git = {
    enable = true;
    lfs.enable = true;
  };
  # git can be configured with home manager TODO

  # Android
  programs.adb.enable = true;
  users.users.juan-david.extraGroups = ["adbusers" "wireshark"];

}
