{pkgs, ...}:

{
  environment.systemPackages = with pkgs; [
    wireshark
  ];
  programs.wireshark = {
    enable = true;
    usbmon.enable = true;
    dumpcap.enable = true;
  };
}

