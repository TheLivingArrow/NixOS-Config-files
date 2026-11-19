# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ inputs, self, ... }:

{
  flake.nixosConfigurations.laptop = 
  let 
    sys = with self.nixosModules; [
        boot
        base 
        nix
        extraPkgs
        user0
        networking
        audio
        locale
    ];    
  in inputs.nixpkgs.lib.nixosSystem 
  {
        modules = sys ++ (with self.nixosModules; [
            ./_hardware-configuration.nix
            laptop-cfg
            hyprland
            nh
            nix
        ]);
  };

  flake.nixosModules.laptop-cfg = { pkgs, upkgs, config, ... }: 
  let 
        modules = with self.nixosModules; [
            wireshark
            zen
            rustdesk    
            zsh
            dolphin
            otter-launcher
            nvf
            zsh
        ];
        packages = with pkgs; [
             bat
             lsd
             kdePackages.ark
             fastfetch
             feh
             flatpak
             freecad
             gamemode 
             gamescope
             inkscape
             lutris
             mangohud
             os-prober
             python3
             quickshell
             tmux
             vlc
             wine-wayland
             wl-clicker
        ];
        unstablePackages = with upkgs; [
            obsidian
            steam
            vesktop
            element-desktop
        ];
  in
  {
    imports = modules;

    networking.hostName = "laptop"; 

    
    fonts.packages = with pkgs; [
      nerd-fonts.jetbrains-mono
    ];
    programs = {
        steam = {
            enable = true;
            extraCompatPackages = with pkgs; [ proton-ge-bin ];
        };
        nh.flake = "$HOME/.nixconf";
    };

    environment.systemPackages = packages ++ unstablePackages;
    # List programs and their settings:
    # List services that you want to enable:
    
    services.xserver.enable = true;
    services.flatpak.enable = true;

    system.stateVersion = "26.05"; 
  };
}


