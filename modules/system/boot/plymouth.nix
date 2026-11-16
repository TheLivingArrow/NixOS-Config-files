{ inputs, ...}:

{
    flake.nixosModules.plymouth = { pkgs, ...}:
    {
      environment.systemPackages = with pkgs; [
          plymouth
          nixos-bgrt-plymouth
      ];
      boot = {
          plymouth = {
            enable = true;
            theme = "bgrt";
          };
      };
    };
}
