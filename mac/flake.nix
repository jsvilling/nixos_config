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
    in
    {

      homeConfigurations = {
        joshua = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;

          modules = [ ./home.nix ];
          extraSpecialArgs = {
            username = "joshua";
          };
        };

        joshua-ipt = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;

          modules = [ ./home.nix ];
          extraSpecialArgs = {
            username = "joshua-ipt";
          };
        };
      };


    };
}
