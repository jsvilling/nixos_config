{ config, pkgs, ... }:

{
  dconf.settings = {
    "org/gnome/desktop/wm/preferences" = {
      button-layout = ":minimize,maximize,close";
    };
  };

  home.packages = with pkgs; [
    gnome-tweaks
    gnome-terminal
    gnomeExtensions.focus-follows-workspace
  ];
}
