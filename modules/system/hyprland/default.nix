{ self, inputs,  ... }:

{
    flake.nixosModules.hyprland = { pkgs, ... }:
    {
        imports = with self.nixosModules; [ 
            otter-launcher 
            cursors
        ];

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
    };
}
