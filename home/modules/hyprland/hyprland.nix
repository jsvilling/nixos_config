{ pkgs, ... }:

let
  hyprLandSrc = ./hyprland.conf;
  waybarSrc = ./waybar;
in {
  home.file = {
    ".config/hypr/hyprland.conf" = {
      source = hyprLandSrc;
      recursive = true;
    };
    ".config/waybar" = {
      source = waybarSrc;
      recursive = true;
    };
  };
  home.packages = with pkgs; [
    kitty
    waybar
    wofi
    nwg-look
    hyprpaper
    dunst
  ];
}
