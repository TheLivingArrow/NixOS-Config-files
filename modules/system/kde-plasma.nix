{inputs, ...}:

{ 
    flake.nixosModules.plasma6 = {...}: {
        imports = [
            ../apps/dolphin.nix
        ];
        services.desktopManager.plasma6.enable = true;
    };
}
