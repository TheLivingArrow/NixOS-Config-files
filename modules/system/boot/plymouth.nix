{ inputs, ...}:

{
    flake.nixosModules.plymouth = { pkgs, ...}:
    {
      environment.systemPackages = with pkgs; [
          plymouth
          nixos-bgrt-plymouth
      ];
      boot.plymouth.theme = "bgrt";
    };
}
