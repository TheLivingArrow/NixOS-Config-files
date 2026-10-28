# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

# Execute all before using:
# sudo nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
# sudo nix-channel --update
{ inputs, self, ... }:

{
  flake.nixosConfigurations.laptop = inputs.nixpkgs.lib.nixosSystem {
        modules = [
            ./_hardware-configuration.nix
            self.nixosModules.laptop-cfg
            self.nixosModules.grub
            self
            self.nixosModules.hyprland
            self.nixosModules.nvf
        ];
  };

  flake.nixosModules.laptop-cfg = { pkgs, ...}: {

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


