{pkgs,  ...}:

{
  environment.systemPackages = with pkgs; [
    neovim
  ];
  programs.neovim = {
    plugins = with pkgs.vim;[
      nvchad
    ];
  };
}
