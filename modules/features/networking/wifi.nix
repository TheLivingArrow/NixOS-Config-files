{inputs, ...}:

{ 
    flake.nixosModules.networking = {...}: {
        networking.networkmanager.enable = true;
    };
}
