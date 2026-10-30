{ inputs, moduleWithSystem, ... }:

{
    flake.nixosModules.apps.zen = moduleWithSystem ({ inputs', ... }: 
    {
        environment.systemPackages = [ inputs'.zen-browser.packages.default ];
    });
}
