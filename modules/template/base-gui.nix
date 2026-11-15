{ self, inputs, ... }:

{
    flake.nixosModules.nixos-base-gui = { ... }:
    { 
        imports = with self.nixosModules; [
            audio
            base
            hyprland
            networking
            nix
            nh
            nvf
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
