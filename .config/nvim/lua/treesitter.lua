require 'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all"
  ensure_installed = { "rust", "c", "lua", "vim", "zig", "go", "odin" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = false,

  -- List of parsers to ignore installing (for "all")
  ignore_install = {},

  ---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
  -- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!
  highlight = {
    enable = true,
    disable = { "c", "rust", "zig", "go" },
  },
  matchup = {
    enable = true, -- mandatory, false will disable the whole extension
    -- [options]
  },
}
local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
parser_config.jai = {
  install_info = {
    url = "/home/algo/code/github/tree-sitter-jai/",
    files = { "src/parser.c", "src/scanner.c" },
  },
  filetype = "jai",
  filetype_to_parsername = "jai",
  indent = {
    enable = true
  }
}
