{ pkgs, config, lib, inputs, ... }:

with lib;

{
  home.packages = with pkgs; [
    (xfce.thunar.override {
      thunarPlugins = with xfce; [
        thunar-archive-plugin
        thunar-volman
        exo
      ];
    })
    xarchiver
  ];

  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      "inode/directory" = [ "thunar.desktop" ];
    };
  };
}