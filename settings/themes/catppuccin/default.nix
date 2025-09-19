{ pkgs, config, lib, inputs, ... }:

with lib;

{
  home-manager.users.theo.imports = with pkgs; [
    inputs.catppuccin.homeModules.catppuccin
    ./hm.nix
  ];

  services.displayManager.sddm.theme = "catppuccin-mocha";
}