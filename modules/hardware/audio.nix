{inputs, ...}:

{
    flake.nixosModules.audio = {pkgs, ...}: {
      environment.systemPackages = [ pkgs.wireplumber ];
      services.pipewire = {
        enable = true;
        pulse.enable = true;
        wireplumber.enable = true;
      };
    };
}
