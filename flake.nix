{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
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

  outputs = { self, nixpkgs, ... }@inputs: 
  let
    SYSTEM = "x86_64-linux";
  in
  {
    nixosConfigurations = { 
      laptop = nixpkgs.lib.nixosSystem {
          specialArgs = {
            inherit inputs;
            inherit SYSTEM;
          };
          modules = [
            ./hosts/laptop/configuration.nix
            inputs.home-manager.nixosModules.default
          ];
      };
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
      };
    };
}
