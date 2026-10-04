# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

# Execute all before using:
# sudo nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
# sudo nix-channel --update
{ config, lib, pkgs, inputs, SYSTEM, USER, ...}:

{
  imports = [ 
    # System
    ./hardware-configuration.nix
    ../../modules/nixos/system/base.nix
    ../../modules/nixos/system/nix.nix
    ../../modules/nixos/system/grub.nix
    ../../modules/nixos/system/sddm.nix
    ../../modules/nixos/system/wifi.nix
    ../../modules/nixos/system/bluetooth.nix
    ../../modules/nixos/system/audio.nix
    ../../modules/nixos/system/hyprland.nix
    ../../modules/nixos/system/kde-plasma.nix
    
    # Apps
    ../../modules/nixos/apps/dolphin.nix
    ../../modules/nixos/apps/nvf.nix
    ../../modules/nixos/apps/rustdesk-client.nix
    ../../modules/nixos/apps/tagstudio.nix
    ../../modules/nixos/apps/wireshark.nix
    ../../modules/nixos/apps/zsh.nix

    # Other
    #../../modules/nixos/setup/fhs.nix
  ];

  networking.hostName = "nixos-laptop07"; # Define your hostname.

  time.timeZone = "Europe/Bucharest";

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.defaultUserShell = pkgs.zsh;
  users.users.daniel-nix = {
   isNormalUser = true;
   extraGroups = [ "wheel" "input" ]; 
   packages = with pkgs; [
   ];
  };
  
  # You can use https://search.nixos.org/ to find more packages (and options).
  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
  ];

  environment.systemPackages = with pkgs; [
    fastfetch
    feh
    flatpak
    gamemode 
    gamescope
    inputs.zen-browser.packages.${SYSTEM}.default
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
    vlc
    wine-wayland
    wl-clicker
  ];

  # List programs and their settings:
  programs.steam = {
    enable = true;
    extraCompatPackages = with pkgs; [ proton-ge-bin ];
  };

  # List services that you want to enable:
  
  services.xserver.enable = true;
  services.flatpak.enable = true;

  # This option defines the first version of NixOS you have installed on this particular machine,
  # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
  #
  # Most users should NEVER change this value after the initial install, for any reason,
  # even if you've upgraded your system to a new NixOS release.
  #
  # This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
  # so changing it will NOT upgrade your system - see https://nixos.org/manual/nixos/stable/#sec-upgrading for how
  # to actually do that.
  #
  # This value being lower than the current NixOS release does NOT mean your system is
  # out of date, out of support, or vulnerable.
  #
  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  #
  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "26.05"; # Did you read the comment?
}

