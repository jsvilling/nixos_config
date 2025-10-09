{ pkgs, ... }:

{
  home.packages = with pkgs; [
  ];

  programs.neovim = {

    plugins = with pkgs.vimPlugins; [
    ];


    extraConfig = ''
      
    '';
  };
}
