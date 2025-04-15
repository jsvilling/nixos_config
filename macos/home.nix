{ config, pkgs, ... }:

{
  home.username = "joshua-ipt";
  home.homeDirectory = /Users/joshua-ipt;
  home.stateVersion = "24.11";

  imports = [
    ../home/modules/git/git.nix
  ];

  programs = {
    home-manager.enable = true;

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
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;
      oh-my-zsh = {
        enable = true;
        plugins = [ "git" ];
        theme = "agnoster";
      };
  };

    vscode = {
      enable = true;
      package = pkgs.vscodium;
      extensions = with pkgs.vscode-extensions; [
        asciidoctor.asciidoctor-vscode
        bbenoist.nix
        jnoortheen.nix-ide
        golang.go
        haskell.haskell
        justusadam.language-haskell
        mkhl.direnv
      ];
      userSettings = {
        "nix.enableLanguageServer" = true;
        "nix.serverPath" = "nil";
        "nix.serverSettings" = {
          "nil" = {
            "diagnostics" = {
              "ignored" = [
                "unused_binding"
                "unused_with"
              ];
              };
              "formatting" = {
                "command" = [ "nixpkgs-fmt" ];
              };
            };
          };
        };
      };

      wezterm = {
        enable = true;
        enableZshIntegration = true;
        extraConfig = "
          local wezterm = require 'wezterm'
          local config = wezterm.config_builder()
          
          config.color_scheme = 'Catppuccin Mocha (Gogh)'
          config.window_background_opacity = 0.5
          
          return config
        ";
      };
  };

  home.packages = with pkgs; [
    htop
    nix-output-monitor
    spotify
    nixpkgs-fmt
    powerline-fonts
  ];
}
