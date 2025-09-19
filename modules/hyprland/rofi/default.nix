{ pkgs, config, lib, inputs, ... }:

with lib;

{
  programs.rofi = {
    enable = true;
    plugins = [ pkgs.rofimoji ];

    extraConfig = import ./../../../settings/rofi/settings.nix;
  };

  home.packages = with pkgs; [
    oath-toolkit
  ];
}