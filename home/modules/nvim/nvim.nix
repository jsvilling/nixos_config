{ pkgs, ... }:

{
  home.packages = with pkgs; [
  ];

  programs.neovim = {

    enable = true;
    extraPackages = with pkgs; [ ripgrep fd ];

    plugins = with pkgs.vimPlugins; [
      rose-pine
      which-key-nvim
      mini-icons
      nvim-web-devicons
      telescope-nvim
      plenary-nvim
      lazygit-nvim
      (nvim-treesitter.withPlugins (p: with p; [
        lua
        nix
      ]))
      neo-tree-nvim
    ];

  };

  xdg.configFile."nvim" = {
    source = ./cfg;
    recursive = true;
  };
}
