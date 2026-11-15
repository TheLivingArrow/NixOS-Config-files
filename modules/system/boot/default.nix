{ inputs, ... }:

{
    flake.nixosModules.boot = { self, pkgs, ... }: {
        environment.systemPackages = with pkgs; [
            os-prober
            efibootmgr
        ];
        imports = with self.nixosModules; [
            grub
            plymouth
            sddm
        ];
    };
}
