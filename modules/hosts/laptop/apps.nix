
# You can use https://search.nixos.org/ to find more packages (and options).

{ self, inputs, moduleWithSystem, ... }:

{
   flake.nixosModules.laptop-cfg-apps = moduleWithSystem ({ pkgs, upkgs, ...}:
   let
        modules = with self.nixosModules; [
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
             kdePackages.ark
             fastfetch
             feh
             flatpak
             freecad
             gamemode 
             gamescope
             inkscape
             lutris
             mangohud
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
        nixpkgs.config = { allowUnfree = true; };
        programs = {
            steam = {
                enable = true;
                extraCompatPackages = with pkgs; [ proton-ge-bin ];
            };
            nh.flake = "$HOME/.nixconf";
        };
   }); 
}

