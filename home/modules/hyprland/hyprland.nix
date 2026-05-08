{ pkgs, ... }:

let
  hyprLandSrc = ./hyprland.conf;
  waybarSrc = ./waybar;
  paperSrc = ./hyprpaper;
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
  ".config/hypr" = {
      source = paperSrc;
      recursive = true;
    };
  };
  home.packages = with pkgs; [
    rose-pine-hyprcursor
    kitty
    waybar
    wofi
    nwg-look
    hyprpaper
    dunst
  ];
}
