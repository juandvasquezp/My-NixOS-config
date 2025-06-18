# Aditional hardware configurations for a variety of use cases

{ config, pkgs, ... }:

{
  # environment.systemPackages = with pkgs; [
  #    #mesa # Mesa is installed isung hardware.opengl.enable
  # ];
  # Apparently vulkan layers are enagled by default https://wiki.nixos.org/wiki/Mesa

  # Enable opengl
  hardware.graphics = {
    enable = true;
    # driSupport = true;
    # driSupport32Bit = true;
  };
}
