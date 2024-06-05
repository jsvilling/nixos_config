{ pkgs, ...}:

{
    enable = true;
    extensions = with pkgs.vscode-extensions; [
        dracula-theme.theme-dracula
    ];
}