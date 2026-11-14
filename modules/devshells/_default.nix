{ inputs, ... }:

{
    imports = [ inputs.devshell.flakeModule ];
    perSystem = { self', ... }:
    {
        devshells.flake = {
            commands = [
                {
                    name = "nvim";
                    package = self'.packages.nvf;
                    help = "Wrapped neovim for editing the config";
                }
                
                {
                    name = "test";
                    command = "nix-instantiate --parse-only";
                }
                {
                    name = "testall";
                    command = "nix-instantiate --parse-only $NH_FLAKE";
                }
            ];
            devshell.interactive.flakeroot.text = ''
                printf "Please input the directory where flake.nix sits in"
                read NH_FLAKE
            '';
        };
    };
}
