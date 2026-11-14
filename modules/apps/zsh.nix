{ inputs, moduleWithSystem, ... }:

{
    flake.nixosModules.zsh = moduleWithSystem ({ pkgs, self', ...}: {
          environment.systemPackages = with pkgs; [
            zsh
            zsh-powerlevel10k
          ];
        
          programs.zsh = {
                 enable = true;
                 autosuggestions.enable = true;
                 syntaxHighlighting.enable = true;
                 ohMyZsh = {
                     enable = true;
                     plugins = [
                       "git"
                       "powerlevel10k"
                     ];
                     theme = "powerlevel10k";
                 };
          };
    });

    perSystem = { pkgs, lib, self', ...}:
    {
          packages.zsh = inputs.wrappers.wrappers.zsh.wrap {
              inherit pkgs;
              zshAliases = {
                  cat = lib.getExe pkgs.bat;
                  srb = "$NH_FLAKE/rebuild.sh";
                  nvim = lib.getExe self'.packages.nvf;
                  editconf = ''
                      cd $NH_FLAKE
                      nvim flake.nix
                      cd -
                  '';
              };

              zshenv.content = ''
                  source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme
              '';

              zshrc.content = ''
                  export EDITOR=nvim
                  COMPLETION_WAITING_DOTS="true"
              '';
          };
    };
}
