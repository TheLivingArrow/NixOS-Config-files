{ inputs, moduleWithSystem, ... }:

{
  flake.nixosModules.hyprland = moduleWithSystem ({ pkgs, self', ... }:
  {
      environment.systemPackages = with pkgs; [
          brightnessctl
          dunst
          hyprland
          hyprshot 
          hyprshutdown
          kitty
          quickshell
          rofi
          self'.packages.caelestia-shell
          wf-recorder
      ]; 
    
      programs.hyprland = {
        enable = true;
        xwayland.enable = true;
      };
  });

  perSystem = { inputs', ... }: {
    packages.caelestia-shell = inputs'.caelestia-shell.packages.with-cli;
  };
}
