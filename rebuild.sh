#!/bin/sh
cd ~/.nixconf
if sudo nixos-rebuild switch --flake .#laptop; then
  git commit -a
  git push -u origin main
else 
  printf "Something has gone wrong brah, look above.\n"
fi
cd -
