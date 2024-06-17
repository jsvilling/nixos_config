{ config, pkgs, lib, ... }:


let 

    gitIdentity = pkgs.writeShellScriptBin "git-identity" (builtins.readFile ./git-identity.sh);

in {
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
    git = (import ./modules/git/git.nix { inherit pkgs; });
    direnv = (import ./modules/direnv.nix { inherit pkgs; });
    zsh = (import ./modules/zsh.nix { inherit pkgs; });
    fzf = (import ./modules/fzf.nix { inherit pkgs; });
    vscode = (import ./modules/vscode.nix { inherit pkgs; });
  }; 
  
  home.sessionVariables.DIRENV_LOG_FORMAT="";

  imports = [
    ./modules/guake.nix
  ];

  home.packages = with pkgs; [
    gitIdentity
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
