{pkgs, inputs, ...}:

{
  environment.systemPackages = with pkgs; [
      hyprshutdown
      hyprshell
      dunst
      hyprland
      rofi
      hyprshot 
      quickshell
      kitty
      wf-recorder
      brightnessctl
      uwsm
      dbus-broker
  ]; 

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
    withUWSM = true;
  };
  programs.uwsm = {
    enable = true;
  };
}
