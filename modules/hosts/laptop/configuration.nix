# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ inputs, self, moduleWithSystem, ... }:

{
  flake.nixosConfigurations.laptop = 
  let 
    sys = with self.nixosModules; [
        boot
        base 
        nix
        user0
        networking
        locale
    ];    
  in inputs.nixpkgs.lib.nixosSystem 
  {
        modules = with self.nixosModules; [
            ./_hardware-configuration.nix
            boot
            laptop-cfg
            audio
            base
            hyprland
            networking
            user0
            locale
            nh
            nix
        ];
  };

  flake.nixosModules.laptop-cfg = moduleWithSystem ({ pkgs, unfreePkgs, upkgs, ... }: 
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
             element-desktop
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
             tree
             vesktop
             vlc
             wine-wayland
             wl-clicker
        ];
        unfreePackages = with unfreePkgs; [
              steam
        ];
        unstablePackages = with upkgs; [
            obsidian
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

    environment.systemPackages = packages ++ unfreePackages ++ unstablePackages;
    # List programs and their settings:
    # List services that you want to enable:
    
    services.xserver.enable = true;
    services.flatpak.enable = true;

    system.stateVersion = "26.05"; 
  });
}


