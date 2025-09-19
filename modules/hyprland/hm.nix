{ pkgs, config, lib, inputs, ... }:

with lib;

let
  settings = import ../../settings/hyprland.nix;
in
{
  imports = with inputs; [
    ./waybar.nix
    ./notifications
    ./rofi
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;

    settings = ({
      exec-once = [
        "${pkgs.mate.mate-polkit}/libexec/polkit-mate-authentication-agent-1"
        "${pkgs.waybar}/bin/waybar"
        "${pkgs.swww}/bin/swww restore"
      ];

      ecosystem = {
        no_update_news = true;
      };

      "$mod" = "SUPER";
    } // settings);
  };

  # Wallpapers!
  services.swww.enable = true;

  home.packages = with pkgs; [
    grim
    grimblast
    libnotify
    wl-clipboard
  ];
}
