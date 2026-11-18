{ inputs, moduleWithSystem, ... }:

{
    flake.nixosModules.zsh = moduleWithSystem ({ pkgs, self', ...}: {
          nixpkgs.overlays = [
            (final: prev: {
                zsh = self'.packages.zsh;
            })
          ];

          environment.systemPackages = with pkgs; [
            zsh-powerlevel10k
          ];

          users.defaultUserShell = pkgs.zsh;

          programs.zsh = {
                 enable = true;
                 autosuggestions.enable = true;
                 syntaxHighlighting.enable = true;
                 enableCompletion = true;
                 enableBashCompletion = true;
                 promptInit = "source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
          };
    });

    perSystem = { pkgs, lib, self', ...}:
    {
          packages.zsh = inputs.wrappers.wrappers.zsh.wrap {
              inherit pkgs;
              zshAliases = {
                  ls = lib.getExe pkgs.lsd;
                  cat = lib.getExe pkgs.bat;
                  srb = "sh -c $NH_FLAKE/rebuild.sh";
                  nvim = lib.getExe self'.packages.nvf;
                  editconf = ''
                      cd $NH_FLAKE
                      nvim flake.nix
                      cd -
                  '';
              };

              zshrc.content = ''
                  if [[ -r ''${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-''${(%):-%n}.zsh ]]; then
                      source "''${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-''${(%):-%n}.zsh"
                  fi
                  source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme
                  export ZSH="$HOME/.oh-my-zsh"
                  export EDITOR=nvim
                  COMPLETION_WAITING_DOTS="true"
                  [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
              '';
                  #source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme
          };
    };
}
