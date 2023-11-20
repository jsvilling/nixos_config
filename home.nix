{ config, pkgs, lib, ... }:

{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "joshua";
  home.homeDirectory = "/home/joshua";

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "23.05";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  programs = {
    direnv = {
      enable = true;
      enableZshIntegration = true;
      nix-direnv.enable = true;
    };
    fzf = {
      enable = true;
      enableZshIntegration = true;
    };
    zsh = {
      enable = true;
      enableAutosuggestions = true;
      enableSyntaxHighlighting = true;
      oh-my-zsh = {
        enable = true;
        plugins = [ "git" ];
        theme = "agnoster";
      };
    }; 
  }; 
  
  home.sessionVariables.DIRENV_LOG_FORMAT="";
  home.packages = with pkgs; [
    tmate
    nix-output-monitor
    _1password-gui
    git
    bat
    btop
    guake
    spotify
    gnomeExtensions.dash-to-dock
    jetbrains.rider
    google-chrome
#    (pkgs.callPackage ./teams-pwa { inherit lib; }).chromium;
    (import ./teams-pwa pkgs).chromium
#    (import ./teams-pwa { inherit lib stdenv imagemagick makeDesktopItem chromium copyDesktopItems google-chrome; }).chromium
  ];
}
