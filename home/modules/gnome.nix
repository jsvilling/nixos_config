{ config, pkgs, ... }:

{
    dconf.settings = {
        "org/gnome/desktop/wm/preferences" = {
            button-layout = ":minimize,maximize,close";
        };
    };

    home.packages = with pkgs; [
        gnome.gnome-tweaks
        gnomeExtensions.focus-follows-workspace
    ];
}