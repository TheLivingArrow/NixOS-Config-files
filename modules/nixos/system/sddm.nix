{pkgs, ...}:

{
  environment.systemPackages = with pkgs; [
  ];
  
  services.displayManager.sddm = {
      enable = true;
      theme = "breeze";
      extraPackages = [];
      wayland.enable = true;
  };
}
