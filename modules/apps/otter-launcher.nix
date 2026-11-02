{ inputs, moduleWithSystem, ... }:

{
    flake.nixosModules.otter-launcher = moduleWithSystem ({ inputs', ...}:
    {
        environment.systemPackages = [
            inputs'.otter-launcher.packages.default
        ];
    });
}
