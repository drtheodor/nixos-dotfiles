{ pkgs, config, lib, inputs, ... }:

with lib;

{
  services.swaync = {
    enable = true;
    settings = import ../../../settings/swaync.nix;
  };
}
