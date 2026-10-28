{ inputs, ... }:

{
    flake.nixosModules.apps.tagstudio = { inputs', ... }:
    {
      environment.systemPackages = [
         inputs'.tagstudio.packages.tagstudio
      ];   
    };
}
