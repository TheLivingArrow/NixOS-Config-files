{ self, inputs, ... }:

{
    flake.nixosModules.nixos-base-gui = { config, lib, ...}:
    let
        modules  = self.nixosModules;
    in
    { 
        imports = with modules; [
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
    };
}
/*let
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
    in */
