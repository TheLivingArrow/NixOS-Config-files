{ inputs, moduleWithSystem, ... }:

{
    flake.nixosModules.otter-launcher = moduleWithSystem ({ inputs', pkgs, ...}:
    {
        environment.systemPackages = [
            inputs'.otter-launcher.packages.default
            pkgs.fsel
        ];
    });
}
