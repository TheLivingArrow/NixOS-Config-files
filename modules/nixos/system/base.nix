{config, lib, pkgs, ...}:

{
  # Appimages 
  programs.appimage.enable = true;
  programs.appimage.binfmt = true;

  # Essential programs
  enviorment.systemPkgs = with pkgs; [
    btop
    cmake
    efibootmgr
    file
    fzf
    gcc
    git
    gnumake
    gzip
    icu
    python3
    tar
    tmux
    unzip
    vim
    wget
    zip
  ];
}

