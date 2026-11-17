{ inputs, ... }:

{
    perSystem = { system, ... }: 
    {
        _module.args = {
            upkgs = import inputs.nixpkgs-unstable {
                inherit system;
            };
        };
    };
}
