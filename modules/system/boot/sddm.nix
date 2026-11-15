{ inputs, ...}:

{
    flake.nixosModules.sddm = { pkgs, ... }:
    {
      services.displayManager.sddm = {
          enable = true;
          theme = "sddm-astronaut-theme"; 
          extraPackages = with pkgs; [ 
              sddm-astronaut 
              kdePackages.qtmultimedia
          ];
          wayland.enable = true;
      };
    };
}
