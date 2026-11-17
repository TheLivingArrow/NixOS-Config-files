{ inputs, ... }:

{
    perSystem = { system, ... }: 
    {
        _module.args = {
            upkgs = import inputs.nixpkgs-unstable { inherit system; };
            unfreePkgs = import inputs.nixpkgs { 
                inherit system; 
                config.allowUnfree = true;
            };
        };
    };
}
