# To make a full kde experience

{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    kdePackages.discover # store
    kdePackages.kcalc
    kdePackages.kcharselect
    kdePackages.kate
    kdePackages.kcolorchooser # A small utility to select a color
    kdePackages.kolourpaint # Easy-to-use paint program
    kdePackages.ksystemlog
    kdePackages.sddm-kcm # Configuration module for SDDM
    kdiff3
    kdePackages.isoimagewriter # Optional: Program to write hybrid ISO files onto USB disks
    hardinfo2 # System information and benchmarks for Linux systems
    # haruna # Open source video player built with Qt/QML and libmpv
    wayland-utils # Wayland utilities
    wl-clipboard # Command-line copy/paste utilities for Wayland
    kdePackages.skanpage
    kdePackages.skanlite
    # texinfo en kubuntu, neochat, centro de bienvenida y thunderbird
  ];

  # kde-connect
  programs.kdeconnect.enable = true;

  # partition manager
  programs.partition-manager.enable = true;
}
