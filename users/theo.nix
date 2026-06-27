{ pkgs, config, lib, inputs, ... }:

with lib;

{
  imports = [
    ./modules/dev-stuff.nix
    ./modules/minecraft.nix
  ];
  
  fonts.fontconfig.enable = true;

  home.packages = with pkgs; [
    htop
    steam
    kdePackages.kdenlive
    vlc
    corefonts
    aseprite
    qbittorrent
    alsa-oss
    reaper
    obs-studio
    krita
    inputs.zen-browser.packages.${pkgs.system}.beta
  ];

  programs.vesktop = {
    enable = true;
  };
  
  home.stateVersion = "23.11";
}
