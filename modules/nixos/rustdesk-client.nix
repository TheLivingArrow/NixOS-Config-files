{pkgs, ...}:

{
  environment.systemPackages = with pkgs [
    rustdesk-flutter
  ];
  programs.rustdesk.enable = true;
}
