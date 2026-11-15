
# You can use https://search.nixos.org/ to find more packages (and options).

{ self, inputs, ... }:

{
   flake.nixosModules.laptop-cfg-apps = { pkgs, ...}:
   let
        modules = with self.nixosModules; [
            otter-launcher
            wireshark
            # tagstudio
            zen
            rustdesk    
            zsh
        ];
   in
   {
        imports = modules;
        environment.systemPackages = with pkgs; [
             bat
             element-desktop
             fastfetch
             feh
             flatpak
             freecad
             gamemode 
             gamescope
             inkscape
             lutris
             mangohud
             obsidian
             os-prober
             python3
             quickshell
             steam
             tmux
             tree
             vesktop
             vlc
             wine-wayland
             wl-clicker
        ];

        programs = {
            steam = {
                enable = true;
                extraCompatPackages = with pkgs; [ proton-ge-bin ];
            };
            nh.flake = "$HOME/.nixconf";
        };
   }; 
}

