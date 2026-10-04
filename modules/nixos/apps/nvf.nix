{pkgs, lib, inputs, ...}:

{
  #imports = [ inputs.nvf.default ];
  programs.nvf = {
      enable = true;
      enableManpages = true;
      settings = {
          vim = {
              theme = {
                  enable = true;
                  name = "gruvbox";
                  style = "dark";
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
              autocomplete.blink-cmp.enable = true;
              statusline.lualine.enable = true;
              filetree.neo-tree.enable = true;
          };
      };
  };
}
