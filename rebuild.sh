#!/bin/sh
confRoot=~/.nixconf # Directory where you keep you configuration. Example: /etc/nixos/
config=laptop

#nobuild = true means that it will only commit and push changes, usefull when developing
while getopts ":u:c:" option; do
  case $option in
    u)
      upgrade=true
      ;;
    c) nobuild=true
      ;;
    *) upgrade=false; nobuild=false
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
if ! $nobuild; then 
    nixos-rebuild switch --sudo --flake .#$config
fi
cd -

