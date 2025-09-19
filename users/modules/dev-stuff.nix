{ pkgs, config, lib, inputs, ... }:

with lib;

{
  imports = with inputs; [
    ./terminal.nix
  ];

  home.packages = with pkgs; [
    # java
    visualvm
    zulu17

    # rust
    rustc
    cargo

    # code editors
    neovim
    neovide
    vscodium
    jetbrains.idea-community
    (jetbrains.idea-ultimate.override {
      vmopts = ''
        --add-opens=java.base/jdk.internal.org.objectweb.asm=ALL-UNNAMED
        --add-opens=java.base/jdk.internal.org.objectweb.asm.tree=ALL-UNNAMED

        -javaagent:/home/theo/.config/JetBrains/jetbra/ja-netfilter.jar=jetbrains
      '';
    })
    insomnia
    android-studio
    #jetbrains.rust-rover
    
    # gamedev
    godot_4

    # git
    gh
    gitbutler
    git
  ];

  programs.direnv = {
    enable = true;
    enableZshIntegration = true;
    enableBashIntegration = true;
    nix-direnv.enable = true;
  };
}
