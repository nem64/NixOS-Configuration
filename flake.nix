{
  description = "Bruh";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager }:
  let
    system = "x86_64-linux";
    pkgs = import nixpkgs {
      inherit system;
    };
    lib = nixpkgs.lib;
  in {
    nixosConfigurations = {
      nemesis = lib.nixosSystem {
        inherit system;
        modules = [
          ./hosts/workstation/configuration.nix
          ./hosts/workstation/network.nix
          ./hosts/workstation/vfio.nix
          home-manager.nixosModules.home-manager {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.nemesis = {
              home.stateVersion = "23.05";
              imports = [ ./hosts/workstation/home.nix ];
            };
          }
        ];
      };
    };
  };
}
