{
  flake.nixosModules.hyprland = {pkgs, inputs', ...}:
    {
      environment.systemPackages = with pkgs; [
          hyprshutdown
          inputs'.caelestia-shell.packages.default
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
    };
}
