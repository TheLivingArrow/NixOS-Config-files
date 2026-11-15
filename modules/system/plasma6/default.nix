{ self, inputs, ...}:

{ 
    flake.nixosModules.plasma6 = {...}: {
        imports = [ self.nixosModules.dolphin ];
        services.desktopManager.plasma6.enable = true;
    };
}
