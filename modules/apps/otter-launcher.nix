{ inputs, ... }:

{
    flake.nixosModules.apps.otter-launcher = { inputs', ...}:
    {
        environment.systemPackages = [
            inputs'.otter-launcher.packages.x86_64-linux.default
        ];
    };
}
