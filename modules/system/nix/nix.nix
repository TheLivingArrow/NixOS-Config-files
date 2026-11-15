{ inputs, ...}: 

{ 
    flake.nixosModules.nix = {...}: {
      nixpkgs.config.allowUnfree = true;
      nix.settings.experimental-features = [ "nix-command" "flakes" ];
      nix.gc.automatic = true;
      nix.gc.dates = "daily";
      nix.optimise.automatic = true;
      nix.optimise.dates = ["24hr"]; 
      system.autoUpgrade = {
            enable = true;
            flake = "../../..";
            flags = [
            "--print-build-logs"
            "--commit-lock-file"  # If you want to automatically commit the updated flake.lock
            ];
            dates = "daily";
            randomizedDelaySec = "45min";
        };
    };
}
