{ config, pkgs, lib, ... }:


let 

    

in {
  home.username = "joshua";
  home.homeDirectory = "/home/joshua";

  home.stateVersion = "23.05";

  programs.home-manager.enable = true;
  
  home.sessionVariables.DIRENV_LOG_FORMAT="";

  imports = [
    ./modules/direnv.nix
    ./modules/fzf.nix
    ./modules/git/git.nix
    ./modules/guake.nix
    ./modules/vscode.nix
    ./modules/zsh.nix
  ];

  home.packages = with pkgs; [
    tmate
    nix-output-monitor
    _1password-gui
    bat
    htop
    spotify
    gnomeExtensions.dash-to-dock
    gnomeExtensions.focus-follows-workspace
    unstable.jetbrains.idea-ultimate
    unstable.jetbrains.rider
    jetbrains.datagrip
    google-chrome
    (import ./teams-pwa pkgs).google-chrome
    discord
    asciidoc
    asciidoctor
    drawing
    lazygit
    imagemagick
    gimp
    killall
    unstable.linux-firmware
    unstable.obsidian
    unstable.terraform
    chromium
    neovim
    brave
    firefox-devedition
  ];
}
