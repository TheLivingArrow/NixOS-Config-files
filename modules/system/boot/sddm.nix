{ inputs, ...}:

{
    flake.nixosModules.sddm = { pkgs, ... }:
    {
      environment.systemPackages = [ pkgs.sddm-astronaut-theme ];
      services.displayManager.sddm = {
          enable = true;
          theme = "sddm-astronaut-theme"; 
          extraPackages = with pkgs; [ 
              kdePackages.qtmultimedia
          ];
          wayland.enable = true;
      };
    };
}
