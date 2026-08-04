{ pkgs, ...}:
{
  environment.systemPackages = with pkgs; [
    steam
    lutris
  ];
  programs.lutris = {
    enable = true;
    extraPackages = with pkgs; [
      gamemode 
      gamescope
      mangohud
    ];
  };
  programs.steam = {
    enable = true;
    extraCompatPackages = with pkgs; [ proton-ge-bin ];
  };
}
