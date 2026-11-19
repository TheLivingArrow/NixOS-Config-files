{ config, inputs, ...}:

{
    flake.nixosConfigurations.default = config.flake.nixosConfigurations.laptop;
}
