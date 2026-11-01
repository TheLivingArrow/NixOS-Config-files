{ inputs, ... }:

{
    flake.nixosModules.tagstudio = { inputs', ... }:
    {
      environment.systemPackages = [
         inputs'.tagstudio.packages.tagstudio
      ];   
    };
}
