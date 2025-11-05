{ config, pkgs, lib, ... }:

let
  exportItermPrefs = pkgs.writeShellScriptBin "export-iterm-prefs" (builtins.readFile ./export-iterm-prefs.sh);
in
{
  home.packages = with pkgs; [
    iterm2
    exportItermPrefs
  ];

  home.file."Library/Preferences/com.googlecode.iterm2.plist.lnk" = {
    source = ./com.googlecode.iterm2.plist;
    enable = true;
    force = true;
  };

  home.activation.itermPrefs = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    cp -f ${./com.googlecode.iterm2.plist} ~/Library/Preferences/com.googlecode.iterm2.plist
    killall cfprefsd 2>/dev/null
    defaults read com.googlecode.iterm2
  '';
}
