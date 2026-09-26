{ pkgs, ... }:

let
  hyprLandSrc = ./hyprland/hyprland.conf;
  waybarSrc = ./waybar;
  paperSrc = ./hyprpaper;
  wofiSrc = ./wofi;
in {
  home.file = {
    ".config/hypr/hyprland/hyprland.conf" = {
      source = hyprLandSrc;
      force = true;
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
    ".config/wofi" = {
      source = wofiSrc;
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
