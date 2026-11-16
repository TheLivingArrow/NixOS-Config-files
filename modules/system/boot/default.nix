{ self, inputs, ... }:

{
    flake.nixosModules.boot = { pkgs, ... }: {
        environment.systemPackages = with pkgs; [
            os-prober
            efibootmgr
        ];
        imports = with self.nixosModules; [
            grub
            sddm
        ];
    };
}
