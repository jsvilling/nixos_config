{ config, pkgs, lib, ... }:

{
  programs.home-manager.enable = true;
  home.stateVersion = "23.05";

  home.username = "joshua-ipt";
  home.homeDirectory = "/home/joshua-ipt";

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
    nix-output-monitor
    _1password-gui
    htop
    unstable.jetbrains.idea-ultimate
    google-chrome
    jdk22
    vscodium
    clamtk
    clamav
    apparmor-pam
    chkrootkit
    iptables
   ];
}
