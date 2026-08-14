{pkgs, ...}:

{
  environment.systemPackages = with pkgs; [
    wireshark
    wireshark-qt
  ];
  programs.wireshark = {
    enable = true;
    usbmon.enable = true;
    dumpcap.enable = true;
  };
}

