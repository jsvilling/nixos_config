{ pkgs, ... }:

{
  home.packages = with pkgs; [
  ];

  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
    plugins = with pkgs.vimPlugins; [
      nvim-lspconfig
      nvim-treesitter.withAllGrammars
      plenary-nvim
      gruvbox-material
      mini-nvim
      nvim-tree-lua
    ];


    extraConfig = ''
      colorscheme gruvbox-material

      " Toggle nvim-tree with <leader>e
      nnoremap <leader>e :NvimTreeToggle<CR>

      " Auto close tree when file opened
      let g:nvim_tree_quit_on_open = 1

      " Disable netrw to avoid conflicts
      let g:nvim_tree_disable_netrw = 1

      " Set the width of the tree window
      let g:nvim_tree_width = 30
    '';
  };
}
