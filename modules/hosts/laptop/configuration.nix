# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ inputs, self, ... }:

{
  flake.nixosConfigurations.laptop = inputs.nixpkgs.lib.nixosSystem {
        modules = with self.nixosModules;[
            ./_hardware-configuration.nix
            nixos-base-gui
            laptop-cfg
            laptop-cfg-apps
	        plasma6
        ];
  };

  flake.nixosModules.laptop-cfg = { pkgs, ...}: {
    imports = [ self.nixosModules.laptop-cfg-apps ];
    # nixos-base.gui = ...;
    networking.hostName = "nixos-laptop07"; # Define your hostname.

    time.timeZone = "Europe/Bucharest";

    # Define a user account. Don't forget to set a password with ‘passwd’.
    users.defaultUserShell = pkgs.zsh;
    users.users.daniel-nix = {
     isNormalUser = true;
     extraGroups = [ "wheel" "input" ]; 
    };
    
    # You can use https://search.nixos.org/ to find more packages (and options).
    fonts.packages = with pkgs; [
      nerd-fonts.jetbrains-mono
    ];

    environment.systemPackages = with pkgs; [
      obsidian
      fastfetch
      feh
      flatpak
      gamemode 
      gamescope
      kitty
      krita
      lutris
      mangohud
      os-prober
      python3
      quickshell
      steam
      tmux
      tree
      vesktop
      discord
      vlc
      wine-wayland
      wl-clicker
      fsel
    ];

    # List programs and their settings:
    programs.steam = {
      enable = true;
      extraCompatPackages = with pkgs; [ proton-ge-bin ];
    };

    # List services that you want to enable:
    
    services.xserver.enable = true;
    services.flatpak.enable = true;

    system.stateVersion = "26.05"; 
  };
}


