{inputs, ...}:

{ 
    flake.nixosModules.plasma6 = {...}: {
        services.desktopManager.plasma6.enable = true;
    };
}
