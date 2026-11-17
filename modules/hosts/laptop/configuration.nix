# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ inputs, self, moduleWithSystem, ... }:

{
  flake.nixosConfigurations.laptop = inputs.nixpkgs.lib.nixosSystem {
        modules = with self.nixosModules;[
            ./_hardware-configuration.nix
            boot
            laptop-cfg
            laptop-cfg-apps
            audio
            base
            hyprland
            networking
            nh
            nix
            nvf
            zsh
        ];
  };

  flake.nixosModules.laptop-cfg = moduleWithSystem ({  pkgs, ...}: {
    imports = with self.nixosModules; [ 
        laptop-cfg-apps 
    ];
    # nixos-base.gui = ...;
    networking.hostName = "laptop"; 

    time.timeZone = "Europe/Bucharest";

    # Define a user account. Don't forget to set a password with ‘passwd’.
    users.users.daniel-nix = {
        initialPassword = "user1";
        isNormalUser = true;
        extraGroups = [ "wheel" "input" ]; 
    };
    
    
    fonts.packages = with pkgs; [
      nerd-fonts.jetbrains-mono
    ];

    environment.sessionVariables = {};

    # List programs and their settings:
    # List services that you want to enable:
    
    services.xserver.enable = true;
    services.flatpak.enable = true;

    system.stateVersion = "26.05"; 
  });
}


