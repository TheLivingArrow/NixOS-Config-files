{ self, inputs, ... }:

{
    flake.nixosModules.nixos-base-gui = { config, lib, ...}:
    let
        modules  = self.nixosModules;
        cfg = config.nixos-base.gui;
    in
    { 
        imports = with modules; [
            base
            nix
            networking
            nvf
            zsh
        ];
        options.nixos-base.gui = {
            bootloader = lib.mkOption {
                type = lib.types.enum [ "grub" "systemd-boot" ];
                default = "grub";
            };
            dm = lib.mkOption {
                type = lib.types.enum [ "sddm" ];
                default = "sddm";
            };
            desktop = lib.mkOption {
                type = lib.types.enum [ "hyprland" "plasma6"];
                default = "hyprland";
            };
        };
        config = lib.mkMerge ( with lib; [
            (mkIf (cfg.dm == "sddm")                 modules.boot.sddm)
            (mkIf (cfg.bootloader == "grub")         modules.boot.grub)
            (mkIf (cfg.bootloader == "systemd-boot") modules.boot.systemd-boot) # Doesnt exist lol
            (mkIf (cfg.desktop == "hyprland")        modules.hyprland)
            (mkIf (cfg.desktop == "plasma6")         modules.plasma6)
        ]);
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
