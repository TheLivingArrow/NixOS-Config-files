#!/bin/sh
config=laptop
path=~/.nixconf/

#build = false means that it will only commit and push changes, usefull when developing
upgrade=0; build=1
echo $*
if [[ ($* == -u) || ($* == --upgrade) ]]; then
    upgrade=1
fi
if [[ ($* == -c) || ($* == --commit-only) ]]; then
    build=0
fi
if [[ ($* == -uc ) ]]; then
    build=0
    upgrade=1
fi

cd $path
if ! nixos-rebuild dry-run --flake .#$config; then
  exit
fi
if [[ $upgrade -eq 1 ]]; then
    nix flake update    
fi
git add .
git commit 
git push origin main
if [[ build -eq 1 ]]; then 
    nixos-rebuild switch --sudo --flake .#$config
fi 
cd -
