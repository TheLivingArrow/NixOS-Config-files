{pkgs, inputs, SYSTEM, ...}:

{
  environment.systemPackages = with pkgs; [
      # inputs.caelestia-shell.packages.${SYSTEM}.with-cli
      dunst
      hyprland
      rofi
      hyprshot 
      quickshell
      kitty
      wf-recorder
      brightnessctl
      uwsm
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
