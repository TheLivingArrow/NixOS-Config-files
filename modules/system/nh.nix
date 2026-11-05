{ inputs, moduleWithSystem, ... }:

{
    flake.nixosModules.nh = moduleWithSystem ({ pkgs, ... }:
    {
        environment.systemPackages = with pkgs; [ nh ];
        programs.nh.enable = true; # Define nh.flake in hosts/<configuration>/apps.nix
    });
}
