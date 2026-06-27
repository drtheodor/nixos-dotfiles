{ pkgs, config, lib, ... }:

with lib;

{
  home.packages = with pkgs; [
    glfw3-minecraft
    prismlauncher
    blockbench
  ];
}
