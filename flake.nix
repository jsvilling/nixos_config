{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";  
    home-manager.url = "github:nix-community/home-manager/release-24.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };


  outputs = inputs@{ nixpkgs, nixpkgs-unstable, home-manager, ... }: 
    let 
      system = "x86_64-linux";
      overlay-unstable = final: prev: {
        # unstable = nixpkgs-unstable.legacyPackages.${prev.system};
        # use this variant if unfree packages are needed:
         unstable = import nixpkgs-unstable {
           inherit system;
           config.allowUnfree = true;
         };
      };
    in {
    defaultPackage.x86_64-linux=home-manager.defaultPackage.x86_64-linux;
    
    nixosConfigurations = {
      
      nixos-laptop = nixpkgs.lib.nixosSystem {
        inherit system;
        
        modules = [
          ./hardware-configuration/laptop-hardware-configuration.nix
          ./configuration.nix
          ({ config, pkgs, ... }: { nixpkgs.overlays = [ overlay-unstable ]; })
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.joshua = import ./home/home.nix;
            home-manager.users.joshua-ipt = import ./home/home-ipt.nix;

            # Optionally, use home-manager.extraSpecialArgs to pass
            # arguments to home.nix
          }
        ];
      };


    nixos-desktop = nixpkgs.lib.nixosSystem {
        inherit system;
        
        modules = [
          ./hardware-configuration/desktop-hardware-configuration.nix
          ./configuration.nix 
          ({ config, pkgs, ... }: { nixpkgs.overlays = [ overlay-unstable ]; })
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.joshua = import ./home/home.nix;

            # Optionally, use home-manager.extraSpecialArgs to pass
            # arguments to home.nix
          }
        ];
      };
    };
  };
}
