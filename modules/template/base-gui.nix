{ self, inputs, ... }:
{
    flake.nixosModules.base-gui =
    let
        modules = with self.nixosModules; [
            audio
            base
            grub 
            hyprland
            networking
            nix
            nvf
            sddm
            zsh
        ];
    in 
    { imports = modules; };
}
