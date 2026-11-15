{ inputs, ... }:

{
    flake.nixosModules.grub = { pkgs, ...}: {
      boot.loader = {
          grub = {
              enable = true;
              useOSProber = true;
              device = "nodev";
              efiSupport = true;
              theme = pkgs.minimal-grub-theme;
          };

          efi.canTouchEfiVariables = true;
      };
    };
}
