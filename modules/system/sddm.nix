{ inputs, ...}:

{
    flake.nixosModules.sddm = { pkgs, ... }:
    {
      services.displayManager.sddm = {
          enable = true;
          theme = "breeze";
          extraPackages = [ ];
          wayland.enable = true;
      };
    };
}
