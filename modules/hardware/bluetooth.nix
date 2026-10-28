{inputs, ...}:

{
    flake.nixosModules.networking = { 
      hardware.bluetooth = {
        enable = true;
        powerOnBoot = false;
      };
    };
}
