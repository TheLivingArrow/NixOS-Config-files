#!/bin/sh
upgrade=false
while getopts ":u:" option; do
  case $option in
    u)
      $upgrade=true
      ;;
    *)
      ;;
  esac
done
cd ~/.nixconf
if nixos-rebuild build --no-build-output --flake .#laptop; then
  git commit -a
  git push -u origin main
  if $upgrade; then
    printf "\nUpgrading system\n"
    sudo nixos-rebuild switch --upgrade --flake .#laptop
  else
    sudo nixos-rebuild switch --flake .#laptop
  fi
else 
  printf "Something has gone wrong brah, look above.\n"
fi
cd -
