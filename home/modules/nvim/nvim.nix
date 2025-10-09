{ pkgs, ... }:

{
  home.packages = with pkgs; [
  ];

  programs.neovim = {

    enable = true;
    #package = pkgs.neovim;
    extraPackages = with pkgs; [ ripgrep fd ];

    plugins = with pkgs.vimPlugins; [
      which-key-nvim
    ];

  };

  xdg.configFile."nvim" = {
    source = ./cfg/lua;
    recursive = true;
  };
}
