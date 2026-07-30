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
if nixos-rebuild build --no-build-output --flake $confRoot#$config; then
  git commit -a
  git push -u origin main
  if $upgrade; then
    sudo nixos-rebuild switch --upgrade --flake $confRoot#$config
  else
    sudo nixos-rebuild switch --flake $confRoot#$config
  fi
else 
  printf "Something has gone wrong brah, look above.\n"
fi
