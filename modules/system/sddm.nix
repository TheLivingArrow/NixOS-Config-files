{ inputs, ...}:

{
    flake.nixosModules.sddm = {...}:
    {
      services.displayManager.sddm = {
          enable = true;
          theme = "breeze";
          extraPackages = [];
          wayland.enable = true;
      };
    };
}
