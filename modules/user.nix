{ pkgs, config, lib, inputs, ... }:

let
  settings = import ./../settings/general.nix;
in
{
  home-manager.users."${settings.userName}" = import ../users/${settings.userName}.nix { inherit pkgs config lib inputs; };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users."${settings.userName}" = {
    isNormalUser = true;
    extraGroups = [ "networkmanager" "wheel" ];
  };

  # Enable automatic login for the user.
  services.getty.autologinUser = settings.userName;
  services.displayManager.autoLogin.user = settings.userName;
}