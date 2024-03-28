require('luarocks-nvim').setup({})
require('neorg').setup({
  load = {
    ["core.defaults"] = {},
    ["core.integrations.treesitter"] = {},
    ["core.autocommands"] = {},
    ["core.concealer"] = {},
    ["core.dirman"] = {
      config = {
        workspaces = {
          notes = "~/notes", -- Format: <name_of_workspace> = <path_to_workspace_root>
        },
        -- Automatically detect whenever we have entered a subdirectory of a workspace
        autodetect = true,
        default_workspace = 'notes',
        open_last_workspace = false,
        index = "index.norg", -- The name of the main (root) .norg file
      }
    }
  }
})

vim.api.nvim_create_user_command('Notes', 'Neorg index', {})
