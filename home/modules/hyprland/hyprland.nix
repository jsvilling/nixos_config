{ pkgs, ... }:

let
  hyprLandSrc = ./hyprland.conf;
  waybarSrc = ./waybar;
in {
  home.file = {
    ".config/hypr/hyprland.conf".source = hyprLandSrc;
    ".config/waybar" = {
      source = waybarSrc;
      recursive = true;
    };
  };
  home.packages = with pkgs; [
    kitty
    waybar
    wofi
    dmenu
    nwg-look
    hyprpaper
  ];
}
