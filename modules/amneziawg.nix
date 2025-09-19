{
  config,
  pkgs,
  ...
}: {
  boot.extraModulePackages = with config.boot.kernelPackages; [
    amneziawg
  ];

  environment.systemPackages = with pkgs; [
    amneziawg-tools
  ];

  networking.networkmanager = {
    enable = true;
    dns = "systemd-resolved";
  };

  services = {
    openssh = {
      enable = true;
      settings.PasswordAuthentication = true;
    };

    resolved.enable = true;
  };

  programs.amnezia-vpn.enable = true;
}