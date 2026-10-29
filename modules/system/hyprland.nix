{ inputs, moduleWithSystem, ... }:

{
  flake.nixosModules.hyprland = moduleWithSystem ({ pkgs, self', ... }:
  {
      environment.systemPackages = with pkgs; [
          hyprshutdown
          self'.packages.caelestia-shell
          dunst
          hyprland
          rofi
          hyprshot 
          quickshell
          kitty
          wf-recorder
          brightnessctl
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
