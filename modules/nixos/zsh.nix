{config, lib, pkgs}: 

{
  environment.systemPackages = with pkgs; [
    zsh
    zsh-autosuggestions
    zsh-powerlevel10k
  ];

  programs.zsh = {
    enable = true;
    autosuggestions.enable = true;
    promptInit ="source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
  };
}
