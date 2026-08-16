{pkgs, ...}:

{
  imports = [
    ../apps/dolphin.nix
  ];
  
  services.desktopManager.plasma6.enable = true;
}
