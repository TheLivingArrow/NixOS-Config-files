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
                srb = "$NH_FLAKE/rebuild.sh";
                nvim = "nix run $NH_FLAKE#nvf";
                editconf = ''
                    cd $NH_FLAKE
                    nvim flake.nix
                    cd -
                '';
            };
          };
    };
}
