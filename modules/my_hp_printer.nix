{ config, pkgs, ... }:
{
  # Enable CUPS printing service
  services.printing = {
    enable = true;
    drivers = [ pkgs.hplipWithPlugin ];
  };
}
