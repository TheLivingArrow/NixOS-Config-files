{pkgs, ...}:

{
  environment.systemPackages = with pkgs; [
  ];
  
  services.displayManager.sddm = {
      enable = true;
      theme = "chili";
      extraPackages = [ pkgs.sddm-chili-theme ];
      wayland.enable = true;
  };
}
