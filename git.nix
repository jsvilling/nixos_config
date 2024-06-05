{ pkgs, ...}:

{
    enable = true;

    userName = "Joshua Villing";

    extraConfig = {
        push.autoSetupRemote = true;
        core.editor = "vim";
        gpg.format = "ssh";
        commit.gpgsign = true;
        user.signingkey = "~/.ssh/id_signedVlot.pub";
    };

    aliases = {
        start = "!git fetch vlot && git checkout -b $1-1 vlot/master";
        wip = "commit -a -m 'fixup! wip'";
        fup = "rebase HEAD~50 --autosquash";
        bump = "!sh /etc/nixos/bump.sh";
    };

}