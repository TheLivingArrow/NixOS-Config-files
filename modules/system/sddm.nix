{ inputs, ...}:

{
    flake.nixosModules.sddm = { pkgs, ... }:
    {
      services.displayManager.sddm = {
          enable = true;
          theme = "Elegant";
          extraPackages = [ pkgs.elegant-sddm ];
          wayland.enable = true;
      };
    };
}
