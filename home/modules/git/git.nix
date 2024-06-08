{ pkgs, ...}:

{
    enable = true;

    userName = "Joshua Villing";

    extraConfig = {
        push.autoSetupRemote = true;
        core.editor = "vim";
        gpg.format = "ssh";
        commit.gpgsign = true;
        
        
        user = {
            signingkey = "~/.ssh/id_signedVlot.pub";
            vlot = {
                name = "Joshua Villing";
                email = "joshua.villing@vlot.ch";
                signingkey = "~/.ssh/id_signedVlot.pub";
            };
            priv = {
                name = "Joshua Villing";
                email = "jsvilling@gmail.com";
                signingkey = "~/.ssh/id_signedVlot.pub";
            };
        };
    };

    aliases = {
        start = "!git fetch vlot && git checkout -b $1-1 vlot/master";
        wip = "commit -a -m 'fixup! wip'";
        fup = "rebase HEAD~50 --autosquash";
        fupm = "!git fetch vlot && git fup";
        bump = "!sh /etc/nixos/home/modules/git/bump.sh";
        pr = "!sh /etc/nixos/home/modules/git/pr.sh";
        id = "! git-identity";
    };

}