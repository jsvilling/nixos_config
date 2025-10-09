{ pkgs, ... }:

{
  home.packages = with pkgs; [
  ];

  programs.neovim = {

    enable = true;
    #package = pkgs.neovim;
    extraPackages = with pkgs; [ ripgrep fd ];

    plugins = with pkgs.vimPlugins; [
    ];

    xdg.configFile."nvim" = {
      source = ./cfg;
      recursive = true;
    };
  };
}
