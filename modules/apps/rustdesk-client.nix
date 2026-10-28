{ inputs, ... }:

{
    flake.nixosModules.apps.ruskdesk = { pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [
        rustdesk-flutter
      ];
    };
}
