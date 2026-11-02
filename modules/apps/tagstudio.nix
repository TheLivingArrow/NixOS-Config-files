{ inputs, moduleWithSystem, ... }:

{
    flake.nixosModules.tagstudio = moduleWithSystem ({ inputs', ... }:
    {
      environment.systemPackages = [
         inputs'.tagstudio.packages.tagstudio
      ];   
    });
}
