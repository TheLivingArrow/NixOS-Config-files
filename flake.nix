{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-26.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";
    import-tree.url = "github:denful/import-tree";
    nvf = {
      url = "github:notashelf/nvf";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    caelestia-shell = {
      url = "github:caelestia-dots/shell";
      inputs = {
        nixpkgs.follows = "nixpkgs";
      };
    };
    tagstudio = {
      url = "github:TagStudioDev/TagStudio";
      inputs.nixpkgs.follows = "nixpkgs"; # Use the same package set as your flake.
      inputs.flake-parts.follows = "flake-parts";
    };
    otter-launcher = {
      url = "github:kuokuo123/otter-launcher";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.flake-parts.follows = "flake-parts";
    };
    zen-browser = {
        url = "github:youwen5/zen-browser-flake";
        inputs.nixpkgs.follows = "nixpkgs"; # NOTE: if you experience a build failure with Zen, the first thing to check is to remove this line!
    };
  };

  outputs = { self, flake-parts, import-tree, ... }@inputs: 
        flake-parts.lib.mkFlake { inherit inputs; } 
            (import-tree ./modules);
}
