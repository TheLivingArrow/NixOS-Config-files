{ inputs, ... }:

{
    imports = [
        inputs.flake-file.flakeModules.dendritic
    ];

    flake-file = {
        description = "Nixos configuration flake by TheLivingArrow on Github";
        inputs = {
            nixpkgs.url = "github:nixos/nixpkgs/nixos-26.05";
            nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
            flake-parts.url = "github:hercules-ci/flake-parts";
            import-tree.url = "github:denful/import-tree";
            flake-file.url = "github:denful/flake-file";
            wrappers = {
                url = "github:nix-community/nix-wrapper-modules"; 
                inputs.nixpkgs.follows = "nixpkgs";
            };
        };
    };

    flake.nixosModules.nix = { pkgs, ... }:
    let 
        system = pkgs.stdenv.hostPlatform.system;
    in
    {
        config._module.args.upkgs = import inputs.nixpkgs-unstable { inherit system; allowUnfree = true; };
        nixpkgs.config = { allowUnfree = true; }
        ;
    };
}
