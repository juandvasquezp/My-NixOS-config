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
    extraPackages = with pkgs; [
      intel-media-driver # For Broadwell (2014) or newer processors. LIBVA_DRIVER_NAME=iHD
      intel-vaapi-driver # For older processors. LIBVA_DRIVER_NAME=i965
      intel-media-sdk    # For Quick Sync Video (QSV)
      #vpl-gpu-rt        # For newer intel
    ];
  };

  environment.sessionVariables = {
    LIBVA_DRIVER_NAME = "iHD"; # O usa "i965" si prefieres probar el otro
  };
}
