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
        start = "git fetch vlot && git checkout -b $1-1 vlot/master";
    };

}