{ self, inputs, ... }:
{
    flake.nixosModules.base-gui =
    let
        modules = with self.nixosModules; [
            audio
            base
            boot.grub 
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
