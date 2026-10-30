{ self, inputs, ...}:

{ 
    flake.nixosModules.plasma6 = {...}: {
        imports = [ self.nixosModules.apps.dolphin ];
        services.desktopManager.plasma6.enable = true;
    };
}
