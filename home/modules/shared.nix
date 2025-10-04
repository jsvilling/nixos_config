{ config, pkgs, ... }:

{
  imports = [
    ./direnv.nix
    ./fzf.nix
    ./git/git.nix
    ./vscode.nix
    ./zsh.nix
  ];

  home.packages = with pkgs; [
    tmate
    nix-output-monitor
    lazygit
  ];
}
