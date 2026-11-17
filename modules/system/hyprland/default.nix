{ inputs, moduleWithSystem, ... }:

{
  flake.nixosModules.hyprland = moduleWithSystem ({ pkgs, self, ... }:
  {
#      imports = with self.nixosModules; [ otter-launcher ];
      xdg.portal = {
          enable = true;
          extraPortals = with pkgs; [ xdg-desktop-portal-hyprland ];
      };
      environment.systemPackages = with pkgs; [
          brightnessctl
          dunst
          hyprland
          hyprcursor
          awww
          hyprshot 
          hyprshutdown
          kitty
          quickshell
          rofi
          wf-recorder
      ]; 
    
      programs.hyprland = {
        enable = true;
        xwayland.enable = true;
      };
  });

  perSystem = { inputs', ... }: {};
}
