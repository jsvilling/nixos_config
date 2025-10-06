{
  description = "Home Manager configuration of joshua";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    { nixpkgs, home-manager, ... }:
    let
      system = "aarch64-darwin";
      pkgs = nixpkgs.legacyPackages.${system};

      usernames = [ "joshua" "joshua-ipt" ];

      mkUserHome = username: {
        name = username;
        value = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [ ./home.nix ];
          extraSpecialArgs = { inherit username; };
        };
      };

    in
    {
      homeConfigurations = builtins.listToAttrs (map mkUserHome usernames);
    };
}
