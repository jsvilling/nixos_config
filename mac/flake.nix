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
      usernames = [ "joshua" "joshua-ipt" ];
      modules = [ ./home.nix ];
    in
    {
      homeConfigurations = import ../home/build-home.nix {
        inherit nixpkgs home-manager system usernames modules;
      };
    };
}
