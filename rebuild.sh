#!/bin/sh
confRoot=~/.nixconf # Directory where you keep you configuration. Example: /etc/nixos/
config=laptop

upgrade=false
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
git commit -a
git push origin main
if $upgrade; then
  nix flake upgrade
  sudo nixos-rebuild switch --flake .#$config
else
  sudo nixos-rebuild switch --flake .#$config
fi
cd -
