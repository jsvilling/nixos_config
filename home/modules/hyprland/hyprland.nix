{ pkgs, ... }:

let
  src = ./hyprland.conf;
in {
  home.file.".config/hypr/hyprland.conf".source = src;
}
