{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "joshua-ipt";
  home.homeDirectory = /Users/joshua-ipt;

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "24.11";
  
  # Let Home Manager install and manage itself.
  #programs.home-manager.enable = true;

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
  };

  home.packages = with pkgs; [
    cmatrix
    htop
  ];
}
