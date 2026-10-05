{pkgs, lib, inputs, ...}:

{
  #imports = [ inputs.nvf.default ];
  programs.nvf = {
      enable = true;
      enableManpages = true;
      settings = {
          vim = {
              globals = {
                  mapleader = " ";
              };
              options = {
                  tabstop = 4;
                  shiftwidth = 0; 
              };
              theme = {
                  enable = true;
                  name = "catppuccin";
                  style = "latte";
              };
              viAlias = false;
              vimAlias = true;
              lsp.enable = true;
              treesitter.enable = true;
              languages = {
                  clang.enable = true;
                  nix.enable = true;
                  python.enable = true;
              };
              mini.tabline.enable = true;
              autocomplete.blink-cmp.enable = true;
              statusline.lualine.enable = true;
              filetree.neo-tree.enable = true;
          };
      };
  };
}
