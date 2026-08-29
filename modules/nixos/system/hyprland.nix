{pkgs, inputs, SYSTEM, ...}:

{
  environment.systemPackages = with pkgs; [
      inputs.caelestia-shell.packages.${SYSTEM}.with-cli
      dunst
      hyprland
      rofi
      hyprshot 
      quickshell
      kitty
      wf-recorder
  ]; 

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };
}
