{pkgs, ...}:

{
  environment.systemPackages = with pkg; [
  ];
  
  services.displayManager.sddm = {
      enable = true;
      theme = "chili";
      extraPackages = [ pkgs.sddm-chili-theme ];
      wayland.enable = true;
  };
}
