{ inputs, ... }:

{
    flake.nixosModules.apps.otter-launcher = { inputs', ...}:
    {
        environment.systemPackages = [
            inputs'.otter-launcher.packages.default
        ];
    };
}
