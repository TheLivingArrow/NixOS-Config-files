{ moduleWithSystem, inputs, ... }:

{
    flake.nixosModules.nvf = moduleWithSystem ({ self', ... }:
    {
        environment.systemPackages = [ self'.packages.nvf ];
    });

    perSystem = { pkgs, ...}:
    {
        packages.nvf = (inputs.nvf.lib.neovimConfiguration {
            modules = [ ./_nvf.conf.nix ];
            inherit pkgs;
        }).neovim;
    };
}
