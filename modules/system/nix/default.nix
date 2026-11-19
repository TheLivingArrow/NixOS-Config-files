{ inputs, ...}: 

{ 
    flake.nixosModules.nix = {...}: {
      nix.settings.experimental-features = [ "nix-command" "flakes" ];
      nix.gc.automatic = true;
      nix.gc.dates = "daily";
      nix.optimise.automatic = true;
      nix.optimise.dates = ["24hr"]; 
      system.autoUpgrade = {
            enable = true;
            flake = "github:TheLivingArrow/Nixos-configuration";
            flags = [
            "--print-build-logs"
            "--commit-lock-file"  # If you want to automatically commit the updated flake.lock
            ];
            dates = "daily";
            randomizedDelaySec = "45min";
        };
    };
}
