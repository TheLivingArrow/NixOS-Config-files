{ inputs, ...}:

{
    flake.nixosModules.boot.sddm = {...}:
    {
      services.displayManager.sddm = {
          enable = true;
          theme = "breeze";
          extraPackages = [];
          wayland.enable = true;
      };
    };
}
