{ inputs, ... }:

{
    flake.nixosModules.apps.librewolf = { pkgs, ... }:
    {
        environment.systemPackages = [ pkgs.librewolf ]; 
    };
}
