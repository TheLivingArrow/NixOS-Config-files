{pkgs, ...}:

{
  environment.systemPackages = with pkgs; [
      kdePackages.dolphin
      kdePackages.qtsvg
      kdePackages.plasma-workspace
  ];
  environment.etc."xdg/menus/applications.menu".source = 
    "${pkgs.kdePackages.plasma-workspace}/etc/xdg/menus/plasma-applications.menu";

}
