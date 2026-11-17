{ inputs, ... }:

{
    flake.nixosModules.rustdesk = { pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [
        rustdesk-flutter
      ];
    };
}
