{ inputs, lib,  ... }:
{
    flake-file.inputs = {
            
        # Apps
        nvf = {
          url = "github:notashelf/nvf";
          inputs.nixpkgs.follows = "nixpkgs";
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
}
