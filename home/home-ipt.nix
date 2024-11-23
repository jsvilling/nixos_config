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
    username = "joshua-ipt";
    homeDirectory = "/home/joshua-ipt";

    packages = with pkgs; [
      nix-output-monitor
      _1password-gui
      htop
      unstable.jetbrains.idea-ultimate
      google-chrome
      vscodium
      clamtk
      clamav
      apparmor-pam
      chkrootkit
      iptables
    ];
  };
}
