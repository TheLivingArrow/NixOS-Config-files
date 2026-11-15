{ inputs, ... }:

{
    flake.nixosModules.base = { pkgs, ... }:
    {
      # Appimages 
      programs.appimage.enable = true;
      programs.appimage.binfmt = true;
    
      # Essential programs
      environment.systemPackages = with pkgs; [
        bash
        btop
        file
        fzf
        gcc
        git
        gnumake
        gnutar
        gzip
        tmux
        unzip
        vim
        zip
      ];
    };
}

