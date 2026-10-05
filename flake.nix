{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nvf = {
      url = "github:notashelf/nvf";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    caelestia-shell = {
      url = "github:caelestia-dots/shell";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    zen-browser = {
      url = "github:youwen5/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    tagstudio = {
      url = "github:TagStudioDev/TagStudio";
      inputs.nixpkgs.follows = "nixpkgs"; # Use the same package set as your flake.
    };
  };

 

  outputs = { self, nixpkgs, nvf, ... }@inputs: 
  let
    SYSTEM = "x86_64-linux";
    USER = {
      name = "daniel-nix";
      home = /home/daniel-nix;
    }; 
  in {
    packages.${SYSTEM}.default = (
        nvf.lib.neovimConfiguration {
            modules = [./modules/nixos/apps/nvf.nix];
            pkgs = nixpkgs.legacyPackages.${SYSTEM};
    }).neovim;

    nixosConfigurations = { 
      laptop = nixpkgs.lib.nixosSystem {
          specialArgs = {
            inherit inputs; 
            inherit SYSTEM;
            inherit USER;
          };
          modules = [
            ./hosts/laptop/configuration.nix
            nvf.nixosModules.default
          ];
      };
      /* Unused for now

      desktop = nixpkgs.lib.nixosSystem {
          specialArgs = {inherit inputs;};
          modules = [
            ./hosts/desktop/configuration.nix
          ];
      };
      usb = nixpkgs.lib.nixosSystem {
          specialArgs = {inherit inputs;};
          modules = [
            ./hosts/usb/configuration.nix
          ];
      }; */
    };
  };
}
