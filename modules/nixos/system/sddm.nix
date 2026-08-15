{pkgs, ...}:

{
  environment.systemPackages = with pkgs; [
  ];
  
  services.displayManager.sddm = {
      enable = true;
      theme = "chili-sddm-theme";
      extraPackages = [ pkgs.sddm-chili-theme ];
      wayland.enable = true;
  };
}
