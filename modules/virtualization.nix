# waydroid, docker, virtualbox

{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    waydroid-helper
  ];
  # waydroid
  virtualisation.waydroid.enable = true;

  # docker
  virtualisation.docker = {
    # root user
    enable = true;

    # my user
    rootless = {
      enable = true;
      setSocketVariable = true;
      # Optionally customize rootless Docker daemon settings
      daemon.settings = {
        dns = [ "1.1.1.1" "8.8.8.8" ];
        registry-mirrors = [ "https://mirror.gcr.io" ];
      };
    };
  };
  users.extraGroups.docker.members = [ "juan-david" ];

  ## virtualbox
  #virtualisation.virtualbox = {
  #  host = {
  #    enable = true;
  #    enableExtensionPack = true;
  #  };
  #};
  #users.extraGroups.vboxusers.members = [ "juan-david" ];
}
