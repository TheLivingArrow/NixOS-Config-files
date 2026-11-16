{ inputs, ... }:

{
    flake.nixosModules.systemd-boot = {
        boot.loader.systemd-boot = {
            enable = true;
            editor = false;
        };
    };
}
