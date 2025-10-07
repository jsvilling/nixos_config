{ nixpkgs, home-manager, system, modules, usernames }:

let
  pkgs = nixpkgs.legacyPackages.${system};

  mkUserHome = username: {
    name = username;
    value = home-manager.lib.homeManagerConfiguration {
      inherit pkgs;
      inherit modules;
      extraSpecialArgs = { inherit username; };
    };
  };
in
builtins.listToAttrs (map mkUserHome usernames)
