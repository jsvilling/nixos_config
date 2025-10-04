{ pkgs, ... }:

{

home.packages = with pkgs; [
  nil
  nixpkgs-fmt
];

  programs.vscode = {
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
}
