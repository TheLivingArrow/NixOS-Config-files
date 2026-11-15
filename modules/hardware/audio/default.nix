{inputs, ...}:

{
    flake.nixosModules.audio = {pkgs, ...}: {
      environment.systemPackages = with pkgs; [ 
          wireplumber
          pavucontrol
      ];
      services.pipewire = {
        enable = true;
        pulse.enable = true;
        alsa.enable = true;
        alsa.support32Bit = true;
        wireplumber.enable = true;
      };
    };
}
