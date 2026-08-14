{pkgs, ...}:

{
  environment.systemPackages = with pkgs [
    rustdesk
  ];
  programs.rustdesk.enable = true;
}
