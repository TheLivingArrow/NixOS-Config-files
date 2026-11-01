{ inputs, ... }:

{
    flake.nixosModules.otter-launcher = { inputs', ...}:
    {
        environment.systemPackages = [
            inputs'.otter-launcher.packages.default
        ];
    };
}
