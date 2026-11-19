#!/bin/sh
config=laptop
path=$NH_FLAKE

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

nix run .#write-flake

# Git
git add .
git commit 

if [[ $build -eq 1 ]]; then 
    git push  
    if [[ $upgrade -eq 1 ]]; then
        nh os switch --upgrade
    else
        nh os switch
    fi
fi 
cd -
