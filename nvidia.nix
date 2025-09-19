{ pkgs, config, lib, inputs, ... }:

with lib;

{
  #nixpkgs.overlays = [
  #  (_: final: {
  #    wlroots = final.wlroots.overrideAttrs (_: {
  #      patches = [
  #        ./patches/wlroots-nvidia.patch
  #        ./patches/wlroots-screenshare.patch
  #      ];
  #    });
  #  })
  #];  

  # Works for Wayland as well
  services.xserver.videoDrivers = [ "nvidia" ];

  environment.variables = {
    __GLX_VENDOR_LIBRARY_NAME = "nvidia";
    GBM_BACKEND = "nvidia-drm";
    XDG_SESSION_TYPE = "wayland";
    LIBVA_DRIVER_NAME = "nvidia";
    NVD_BACKEND = "direct";

    QT_AUTO_SCREEN_SCALE_FACTOR = "1";
    QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
    QT_QPA_PLATFORMTHEME = "kvantum";
    QT_STYLE_OVERRIDE="kvantum";
  };
  
  hardware.nvidia = {
    # Is needed for Wayland compositors
    modesetting.enable = true;

    powerManagement.enable = false; 
    powerManagement.finegrained = false;

    # Use open source driver
    open = false;

    # Enable nvidia settings menu
    nvidiaSettings = true;
    
    # Driver package. Using an outdated driver which doesn't cause problems with games.
    /*package = config.boot.kernelPackages.nvidiaPackages.mkDriver {
      version = "535.113.01";
      sha256_64bit = "sha256-KOME2N/oG39en2BAS/OMYvyjVXjZdSLjxwoOjyMWdIE=";
      sha256_aarch64 = "sha256-k7k22z5PYZdBVfuYXVcl9SFUMqZmK4qyxoRwlYyRdgU=";
      openSha256 = "sha256-dktHCoESqoNfu5M73aY5MQGROlZawZwzBqs3RkOyfoQ=";
      settingsSha256 = "sha256-hiX5Nc4JhiYYt0jaRgQzfnmlEQikQjuO0kHnqGdDa04=";
      persistencedSha256 = "sha256-ci86XGlno6DbHw6rkVSzBpopaapfJvk0+lHcR4LDq50=";

      ibtSupport = true;
    };*/
    package = config.boot.kernelPackages.nvidiaPackages.beta;
    /*package = config.boot.kernelPackages.nvidiaPackages.mkDriver {
      version = "555.58";
      sha256_64bit = "sha256-bXvcXkg2kQZuCNKRZM5QoTaTjF4l2TtrsKUvyicj5ew=";
      sha256_aarch64 = "sha256-7XswQwW1iFP4ji5mbRQ6PVEhD4SGWpjUJe1o8zoXYRE=";
      openSha256 = "sha256-hEAmFISMuXm8tbsrB+WiUcEFuSGRNZ37aKWvf0WJ2/c=";
      settingsSha256 = "sha256-vWnrXlBCb3K5uVkDFmJDVq51wrCoqgPF03lSjZOuU8M=";
      persistencedSha256 = "sha256-lyYxDuGDTMdGxX3CaiWUh1IQuQlkI2hPEs5LI20vEVw=";

      ibtSupport = true;
    };*/
  };
}
