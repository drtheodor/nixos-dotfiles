{ pkgs, config, lib, inputs, ... }:

with lib;

{
  imports = with pkgs; [
    ./thunar
  ];

  home-manager.users.theo.imports = with pkgs; [
    ./hm.nix
  ];

  services.xserver.displayManager.setupCommands = "Hyprland";

  xdg.portal = {
    enable = true;
    #wlr.enable = true;

    extraPortals = with pkgs; [
      xdg-desktop-portal-hyprland
      xdg-desktop-portal-wlr
      xdg-desktop-portal-gtk
    ];
  };

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  services.displayManager.defaultSession = "hyprland";
  services.gnome.gnome-keyring.enable = true;

  services.displayManager.sddm = {
    enable = true;
    package = pkgs.libsForQt5.sddm;
    wayland.enable = true;
    autoNumlock = true;
  };

  security.polkit.enable = true;

  environment.systemPackages = with pkgs; [
    xdg-desktop-portal-hyprland
    xdg-desktop-portal-gtk
    mate.mate-polkit
    gnome-keyring
  ];
}