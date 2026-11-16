{ inputs, moduleWithSystem, ... }:

{
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
