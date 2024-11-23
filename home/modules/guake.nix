{ config, pkgs, ... }:

{
  dconf.settings = {
    "org/guake/general" = {
      gtk-prefer-dark-theme = true;
      gtk-use-system-default-theme = true;
      restore-tabs-notify = true;
      restore-tabs-startup = true;
      save-tabs-when-changed = true;
      start-at-login = true;
      transparency = 75;
    };

    "org/guake/keybindings/global" = {
      show-hide = "F12";
    };

    "org/guake/keybindings/local" = {
      toggle-fullscreen = "F11";

      clipboard-copy = "<Control><Shift>c";
      clipboard-paste = "<Control><Shift>v";

      # In tab navigation
      focus-terminal-down = "<Alt>Down";
      focus-terminal-left = "<Alt>Left";
      focus-terminal-right = "<Alt>Right";
      focus-terminal-up = "<Alt>Up";

      # Between tabs navigation
      next-tab = "<Control>Right";
      previous-tab = "<Control>Left";

      # Open new
      new-tab = "<Control><Shift>t";
      split-tab-horizontal = "<Shift>Down";
      split-tab-vertical = "<Shift>Right";
    };
  };

  home.packages = with pkgs; [
    guake
  ];
}
