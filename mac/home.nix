{ config, pkgs, ... }:

{
  home.username = "joshua";
  home.homeDirectory = "/Users/joshua";
  home.stateVersion = "25.05";

  imports = [
    ../home/modules/iterm/iterm.nix
    ../home/modules/shared.nix
  ];

  home.packages = with pkgs; [
  ];

  programs.home-manager.enable = true;
}
