{config, pkgs, ...}:

{
  environment.systemPackages = with pkgs; [
    steam
    lutris
    mangohud
    gamescope
    gamemode
  ];
}
