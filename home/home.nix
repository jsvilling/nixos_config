{ config, pkgs, lib, ... }:

{
  programs.home-manager.enable = true;

  imports = [
    ./modules/direnv.nix
    ./modules/fzf.nix
    ./modules/git/git.nix
    ./modules/guake.nix
    ./modules/gnome.nix
    ./modules/hyprland/hyprland.nix
    ./modules/nvim/nvim.nix
    ./modules/vscode.nix
    ./modules/zsh.nix
  ];

  home = {
    stateVersion = "23.05";
    username = "joshua";
    homeDirectory = "/home/joshua";

    packages = with pkgs; [
      tmate
      nix-output-monitor
      _1password-gui
      htop
      spotify
      jetbrains.idea
      jetbrains.rider
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
      chromium
      brave
      firefox-devedition
      vscodium
      clamtk
      clamav
      apparmor-pam
      iptables
      nil
      nixpkgs-fmt
      qmk_hid
    ];
  };
}
