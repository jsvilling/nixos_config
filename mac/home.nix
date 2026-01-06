{ config, pkgs, username, ... }:

{
  home.username = username;
  home.homeDirectory = "/Users/${username}";
  home.stateVersion = "25.05";

  imports = [
    ../home/modules/iterm/iterm.nix
    ../home/modules/shared.nix
  ];

  home.packages = with pkgs; [
    podman
    podman-compose
  ];

  home.sessionVariables = {
    DOCKER_HOST = "unix:///Users/${builtins.getEnv "USER"}/.local/share/podman/podman.sock";
  };

  programs.home-manager.enable = true;
}
