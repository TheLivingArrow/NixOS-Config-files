{pkgs, lib, inputs, ...}:

{
  programs.nvf = {
    enable = true; 
    vim = {
      theme = {
        enable = true;
        name = "gruvbox";
        style = "dark";
      };
      statusline.lualine.enable = true;
      telescope.enable = true;
      autocomplete.nvim-cmp.enable = true;
    }
  }
}
