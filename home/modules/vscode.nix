{ pkgs, ... }:

{

  home.packages = with pkgs; [
    nil
    nixpkgs-fmt
  ];

  programs.vscode = with pkgs; {
    enable = true;
    package = vscodium;

    profiles.default = {
      extensions = with vscode-extensions; [
        asciidoctor.asciidoctor-vscode
        bbenoist.nix
        jnoortheen.nix-ide
        golang.go
        haskell.haskell
        justusadam.language-haskell
        mkhl.direnv
      ];

      userSettings = {
        "editor.formatOnSave" = true;
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
}
