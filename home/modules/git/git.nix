{ pkgs, ...}:

let 
    gitIdentity = pkgs.writeShellScriptBin "git-identity" (builtins.readFile ./git-identity.sh);
    gitBump = pkgs.writeShellScriptBin "git-bump" (builtins.readFile ./bump.sh);
    gitPr = pkgs.writeShellScriptBin "git-pr" (builtins.readFile ./pr.sh);
in {

    programs.git = {
        enable = true;

        extraConfig = {
            push.autoSetupRemote = true;
            core.editor = "vim";
            
            user = {
                vlot = {
                    name = "Joshua Villing";
                    email = "joshua.villing@vlot.ch";
                    gpgsign = true;
                    gpgformat = "ssh";
                    signingkey = "~/.ssh/id_signedVlot.pub";
                };
                priv = {
                    name = "Joshua Villing";
                    email = "jsvilling@gmail.com";
                    gpgsign = false;
                };
            };
        };

        aliases = {
            wip = "commit -a -m 'fixup! wip'";
            fup = "rebase HEAD~50 --autosquash";
            bump = "! git bump";
            pr = "! git-pr";
            id = "! git-identity";
        };
    };

    home.packages = with pkgs; [
        gitIdentity
        gitBump
        gitPr
    ];
}