{ self, inputs, ... }:

{
    flake.nixosModules.user0 = { pkgs, ... }:
    {
        imports = with self.nixosModules; [ zsh ];
        users.users.daniel-nix = {
            initialPassword = "password";
            description = "user0";
            isNormalUser = true;
            shell = pkgs.zsh;
            extraGroups = [
                "wheel"
                "input"
            ];
        };
    };
}
