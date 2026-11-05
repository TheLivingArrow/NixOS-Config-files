#!/bin/sh
config=laptop
path=~/.nixconf/

#Arguments 
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

# Check config validity
cd $path
if ! nh os build --dry; then
  exit
fi

# Git
git add .
git commit 
if [[ $upgrade -eq 1 ]]; then
    nix flake update --commit-lock-file    
fi
if [[ $build -eq 1 ]]; then 
    git push
    nh os switch
fi 
cd -
