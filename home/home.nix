{ config, pkgs, lib, ... }:

{
  programs.home-manager.enable = true;

  imports = [
    ./modules/direnv.nix
    ./modules/fzf.nix
    ./modules/git/git.nix
    ./modules/guake.nix
    ./modules/gnome.nix
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
      bat
      htop
      spotify
      jetbrains.idea-ultimate
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
      chkrootkit
      iptables
      nil
      nixpkgs-fmt
      dotnet-sdk_8
      qmk_hid
    ];
  };
}
