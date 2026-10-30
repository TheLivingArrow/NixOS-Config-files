{pkgs, lib, inputs, ...}:

{
    vim = {
        globals = {
            mapleader = " ";
        };
        options = {
            tabstop = 4;
            shiftwidth = 0; 
            wrap = false;
        };
        theme = {
            enable = true;
            name = "gruvbox";
            style = "dark";/*
            base16-colors = {
                base00 = "181818";
                base01 = "282828";
                base02 = "383838";
                base03 = "585858";
                base04 = "b8b8b8";
                base05 = "d8d8d8";
                base06 = "e8e8e8";
                base07 = "f8f8f8";
                base08 = "ab4642";
                base09 = "dc9656";
                base0A = "f7ca88";
                base0B = "a1b56c";
                base0C = "86c1b9";
                base0D = "7cafc2";
                base0E = "ba8baf";
                base0F = "a16946";
            };*/
        };
        keymaps = [
          {
              key = "\\";
              mode = ["n"];
              action = "<cmd>lua vim.diagnostic.open_float()<CR>";
              silent = true;
          }
          {
              key = "tab";
              mode = ["n"];
              action = "<cmd>Neotree toggle<CR>";
              silent = true;
          }
        ];
        viAlias = false;
        vimAlias = true;
        lsp.enable = true;
        treesitter.enable = true;
        languages = {
            bash.enable   = true;
            clang.enable  = true;
            json.enable   = true;
            lua.enable    = true;
            nix.enable    = true;
            python.enable = true;
            toml.enable   = true;
        };
        diagnostics.config = {
            virtual_text = {
                format = lib.generators.mkLuaInline ''
                    function(diagnostic)
                    return string.format("%s (%s)", diagnostic.message, diagnostic.source)
                    end
                '';
            };
        };
        mini.tabline.enable = true;
        autocomplete.blink-cmp.enable = true;
        statusline.lualine.enable = true;
        filetree.neo-tree.enable = true;
    };
}
