{ self', inputs, ... }:

{
    flake.nixosModules.nvf = {...}:
    {
        environment.systemPackages = [ self'.packages.nvf ];
    };
    perSystem = { pkgs, ...}:
    {
        packages.nvf = (inputs.nvf.lib.neovimConfiguration {
            modules = [ ./_nvf.conf.nix ];
            inherit pkgs;
        }).neovim;
    };
}
