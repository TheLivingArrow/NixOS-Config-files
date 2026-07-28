cd ~/.nixconf
sudo nixos-rebuild switch --flake .#laptop
git commit -a
git push -u origin main
cd -
