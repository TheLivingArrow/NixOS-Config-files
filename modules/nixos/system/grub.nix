{ pkgs, ...}:

{
  environment.systemPackages = with pkgs; [
    os-prober
    efibootmgr
  ];
  boot.loader = {
       grub = {
          enable = true;
          useOSProber = true;
          device = "nodev";
          efiSupport = true;
       };
       efi = {
         canTouchEfiVariables = true;
       };
  };
}
