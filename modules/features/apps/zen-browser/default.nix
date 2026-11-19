{ inputs, moduleWithSystem, ... }:

{
    flake-file.inputs.zen-browser = {
        url = "github:youwen5/zen-browser-flake";
        inputs.nixpkgs.follows = "nixpkgs"; # NOTE: if you experience a build failure with Zen, the first thing to check is to remove this line!
    };

    flake.nixosModules.zen = moduleWithSystem ({ inputs', ... }: 
    {
        environment.systemPackages = [ inputs'.zen-browser.packages.default ];
    });
}
