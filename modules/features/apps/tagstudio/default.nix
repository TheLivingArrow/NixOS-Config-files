{ inputs, moduleWithSystem, ... }:

{
    flake-file.inputs.tagstudio = {
        url = "github:TagStudioDev/TagStudio";
         inputs.nixpkgs.follows = "nixpkgs"; # Use the same package set as your flake.
         inputs.flake-parts.follows = "flake-parts";
    };

    flake.nixosModules.tagstudio = moduleWithSystem ({ inputs', ... }:
    {
      environment.systemPackages = [ inputs'.tagstudio.packages.tagstudio ];   
    });
}
