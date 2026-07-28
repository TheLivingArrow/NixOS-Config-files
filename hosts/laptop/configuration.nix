# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

# Execute all before using:
# sudo nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
# sudo nix-channel --update
{ config, lib, pkgs,inputs , ... }:

{
  imports = 
  let
     modules = ../..; # root of the nix config
  in [ 
     ./hardware-configuration.nix 
     modules/nixos/hyprland.nix
     modules/nixos/niri.nix
  ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nixpkgs.config.allowUnfree = true;

  boot.loader = {
       systemd-boot = {
          enable = true;
	  configurationLimit = 5;
       };
       efi = {
         canTouchEfiVariables = true;
       };
  };

 
 networking.hostName = "nixos-laptop07"; # Define your hostname.


 networking.networkmanager.enable = true;

  time.timeZone = "Europe/Bucharest";

   services.pipewire = {
     enable = true;
     pulse.enable = true;
     wireplumber.enable = true;
   };

  # Enable touchpad support (enabled default in most desktopManager).
  services.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
 users.defaultUserShell = pkgs.zsh;
 users.users.daniel-nix = {
   isNormalUser = true;
   extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
   packages = with pkgs; [
	    lutris
	    steam
	    hyprshot
    	quickshell
    	rofi
    	tree
      gamemode
    	vesktop
      inputs.caelestia-shell.packages.x86_64-linux.with-cli
      krita
      inkscape
      lmms-full
   ];
 };

  # You can use https://search.nixos.org/ to find more packages (and options).
fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
];
  environment.systemPackages = with pkgs; [
    neovim    
    fastfetch
    firefox
    inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default
    vim
    zsh
    dunst
    hyprland
    niri
    kitty
    btop
    tmux
    wireplumber
    fzf
    git
    efibootmgr
   ];

  # List services that you want to enable:
  programs.steam = {
    enable = true;
    extraCompatPackages = [pkgs.proton-ge-bin]
  }
  services.xserver.enable = true;
  programs.zsh.enable = true;
  programs.firefox.enable = true;
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };
  services.displayManager.sddm = {
      enable = true;
      theme = "breeze";
  };
  programs.niri.enable = true;
  services.desktopManager.plasma6.enable = true;
  # system.copySystemConfiguration = true;

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

