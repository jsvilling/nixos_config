{ config, pkgs, ... }:

{
  imports = [
    ./direnv.nix
    ./fzf.nix
    ./git/git.nix
    ./nvim/nvim.nix
    ./vscode.nix
    ./zsh.nix
  ];

  home.packages = with pkgs; [
    tmate
    nix-output-monitor
    lazygit
  ];
}
