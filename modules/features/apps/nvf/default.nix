{ moduleWithSystem, inputs, ... }:

{
    flake-file.inputs.nvf = {
        url = "github:notashelf/nvf";
        inputs.nixpkgs.follows = "nixpkgs";
    };

    flake.nixosModules.nvf = moduleWithSystem ({ self', ... }:
    {
        environment.systemPackages = [ self'.packages.nvf ];
    });

    perSystem = { pkgs, ...}:
    {
        packages.nvf = (inputs.nvf.lib.neovimConfiguration {
            modules = [ ./_config.nix ];
            inherit pkgs;
        }).neovim;
    };
}
