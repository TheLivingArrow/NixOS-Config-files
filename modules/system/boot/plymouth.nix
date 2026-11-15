{ inputs, ...}:

{
    flake.nixosModules.plymouth = { pkgs, ...}:
    {
      environment.systemPackages = with pkgs; [
          plymouth
          nixos-bgrt-plymouth
      ];
      boot.plymouth = {
        enable = true;
        theme = "bgrt";
      };
      consoleLogLevel = 3;
      initrd.verbose = false;
      kernelParams = [
        "quiet"
        "rd.udev.log_level=3"
        "rd.systemd.show_status=auto"
      ];

    };
}
