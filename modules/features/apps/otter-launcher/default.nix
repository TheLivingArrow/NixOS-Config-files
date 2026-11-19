{ inputs, moduleWithSystem, ... }:

{
    flake-file.inputs.otter-launcher = {
        url = "github:kuokuo123/otter-launcher";
        inputs.nixpkgs.follows = "nixpkgs";
        inputs.flake-parts.follows = "flake-parts";
    };
    
    flake.nixosModules.otter-launcher = moduleWithSystem ({ self', ... }:
    {
        environment.systemPackages = [
            self'.packages.otter-launcher
        ];
    });

    perSystem = { inputs', pkgs, ... }: 
    {
            packages.otter-launcher = inputs.wrappers.lib.wrapPackage ({ ... }:
            {
                inherit pkgs;
                package = inputs'.otter-launcher.packages.default;
                runtimePkgs = with pkgs; [
                    fsel
                ];
                flags = {
                    "-c" = ./config.toml;
                };
            });
    };
}
