#!/bin/sh
confRoot=~/.nixconf # Directory where you keep you configuration. Example: /etc/nixos/
config=laptop

upgrade=false # Dont edit this
while getopts ":u:" option; do
  case $option in
    u)
      upgrade=true
      ;;
    *)
      ;;
  esac
done

cd $confRoot
if $upgrade; then
  nix flake upgrade
fi
git add .
git commit 
git push origin main
sudo nixos-rebuild switch --flake .#$config
cd -
