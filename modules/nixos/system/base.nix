{config, lib, pkgs, ...}:

{
  # Appimages 
  programs.appimage.enable = true;
  programs.appimage.binfmt = true;

  # Essential programs
  environment.systemPackages = with pkgs; [
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
    gnutar
    tmux
    unzip
    vim
    wget
    zip
  ];
}

