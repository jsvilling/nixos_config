{ config, pkgs, lib, ... }:

{
  programs.home-manager.enable = true;
  home.stateVersion = "23.05";

  home.username = "joshua";
  home.homeDirectory = "/home/joshua";

  imports = [
    ./modules/direnv.nix
    ./modules/fzf.nix
    ./modules/git/git.nix
    ./modules/guake.nix
    ./modules/gnome.nix
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
    unstable.jetbrains.idea-ultimate
    unstable.jetbrains.rider
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
    vscodium
    clamtk
    clamav
    apparmor-pam
    chkrootkit
    iptables
    nil
    nixpkgs-fmt
  ];
}
