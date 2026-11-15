{ inputs, moduleWithSystem, ... }:

{
    flake.nixosModules.zsh = moduleWithSystem ({ pkgs, self', ...}: {
          environment.systemPackages = with pkgs; [
            zsh
            zsh-powerlevel10k
          ];

          nixpkgs.overlays = [
            (final: prev: {
                zsh = self'.packages.zsh;
            })
          ];

          users.defaultUserShell = pkgs.zsh;

          programs.zsh = {
                 enable = true;
                 autosuggestions.enable = true;
                 syntaxHighlighting.enable = true;
                 enableCompletion = true;
                 enableBashCompletion = true;
                 promptInit = "source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
                 ohMyZsh = {
                     enable = true;
                     plugins = [];
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

              zshenv.content = '''';

              zshrc.content = ''
                  if [[ -r ''${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-''${(%):-%n}.zsh ]]; then
                      source "''${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-''${(%):-%n}.zsh"
                  fi
                  source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme
                  export ZSH="$HOME/.oh-my-zsh"
                  export EDITOR=nvim
                  source $ZSH/oh-my-zsh.sh
                  COMPLETION_WAITING_DOTS="true"
                  [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
              '';
                  #source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme
          };
    };
}
