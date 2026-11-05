
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
        ];
   in
   {
        imports = modules;
        environment.systemPackages = with pkgs; [
             element-desktop
             fastfetch
             feh
             flatpak
             gamemode 
             gamescope
             inkscape
             kitty
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
             fsel
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

