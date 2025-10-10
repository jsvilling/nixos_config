{ pkgs, ... }:

{
  home.packages = with pkgs; [
  ];

  programs.neovim = {

    enable = true;
    #package = pkgs.neovim;
    extraPackages = with pkgs; [ ripgrep fd ];

    plugins = with pkgs.vimPlugins; [
      rose-pine
      which-key-nvim
      telescope-nvim
      plenary-nvim
      lazygit-nvim
    ];

  };

  xdg.configFile."nvim" = {
    source = ./cfg;
    recursive = true;
  };
}
