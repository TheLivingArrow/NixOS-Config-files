{ inputs, ... }:

{
    flake.nixosModules.zsh = { pkgs, ...}: {
          environment.systemPackages = with pkgs; [
            zsh
            zsh-autosuggestions
            zsh-powerlevel10k
          ];
        
          programs.zsh = {
            enable = true;
            autosuggestions.enable = true;
            promptInit ="source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
            shellAliases = {
                srb = "$NIXOS_CONFIG/rebuild.sh";
                nvim = "nix run $NIXOS_CONFIG#nvf";
                editconf = ''
                    cd $NIXOS_CONFIG
                    nvim flake.nix
                    cd -
                '';
            };
          };
    };
}
