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
if ! nixos-rebuild dry-build --sudo --impure --flake ".#$config" 1> /dev/null; then # checks if build is valid
    exit 1;
fi
if $upgrade; then
    nix flake upgrade
fi
git add .
git commit 
git push origin main
nixos-rebuild switch --sudo --flake .#$config
cd -

