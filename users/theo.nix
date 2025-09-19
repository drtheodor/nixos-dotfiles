{ pkgs, config, lib, inputs, ... }:

with lib;

{
  imports = with inputs; [
    ./modules/dev-stuff.nix
    ./modules/minecraft.nix
  ];

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
    (inputs.zen-browser.packages.${pkgs.system}.beta.override {
      iconsDir = "${inputs.assets}/icons/zen-browser";
    })
  ];

  programs.vesktop = {
    enable = true;
  };
  
  home.stateVersion = "23.11";
}
