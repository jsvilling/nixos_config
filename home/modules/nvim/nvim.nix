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
      (nvim-treesitter.withPlugins (p: with p; [
        lua
        nix
      ]))
    ];

  };

  xdg.configFile."nvim" = {
    source = ./cfg;
    recursive = true;
  };
}
