{ config, pkgs, ... }:

{
    
    gtk = {
        enable = true;
        
        theme.package = pkgs.tokyonight-gtk-theme;  
        theme.name = "Tokyonight-Dark-BL";
    };

    dconf.settings = {
        "org/gnome/desktop/interface" = {
            gtk-theme = "Tokyonight-Dark-BL";
        };
    };

    home.packages = with pkgs; [
        tokyonight-gtk-theme
        gnomeExtensions.focus-follows-workspace
    ];
}
