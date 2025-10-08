{ pkgs, ... }:

{
  home.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    powerline-fonts
  ];

  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    oh-my-zsh = {
      enable = true;
      plugins = [ "git" ];
      theme = "agnoster";
    };

    initExtra = ''
      bindkey -e

      # Define a ZLE (Zsh Line Editor) widget to run lazygit
      lazygit-widget() {
        lazygit                       
        zle reset-prompt              
      }

      zle -N lazygit-widget           
      bindkey '^X' lazygit-widget     
    '';
  };
}
