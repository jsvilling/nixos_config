{ config, pkgs, lib, ... }:

{
  programs.home-manager.enable = true;

  imports = [
    ./modules/direnv.nix
    ./modules/fzf.nix
    ./modules/git/git.nix
    ./modules/guake.nix
    ./modules/gnome.nix
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
      bat
      htop
      spotify
      unstable.jetbrains.idea-ultimate
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
      dotnet-sdk_8
    ];
  };
}
