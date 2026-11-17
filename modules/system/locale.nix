{ inputs, ... }:

{
    flake.nixosModules.locale = { ... }: 
    {
        time.timeZone = "Europe/Bucharest";
    };
}
