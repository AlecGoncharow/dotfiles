-- See `:help vim.diagnostic.*` for documentation on any of the below functiolocal opts = { noremap = true, silent = true }
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

vim.lsp.set_log_level("info")

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, "formatexpr", "v:lua.vim.lsp.formatexpr()")
  vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
  vim.api.nvim_buf_set_option(bufnr, "tagfunc", "v:lua.vim.lsp.tagfunc")

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap = true, silent = true, buffer = bufnr }
  vim.keymap.set('n', 'gk', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', '<leader><leader>', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
  -- disable lsp highlighting
  -- client.server_capabilities.semanticTokensProvider = nil
end
-- Setup buffer-local keymaps / options for LSP buffers
local capabilities = require("cmp_nvim_lsp").default_capabilities()
-- Setup rust_analyzer via rust-tools.nvim
require("rust-tools").setup({
  server = {
    capabilities = capabilities,
    on_attach = on_attach,
    settings = {
      ['rust-analyzer'] = {
        cargo = {
          features = "all"
        }
      }
    }
  }
})

-- https://github.com/ray-x/go.nvim#lsp-cmp-support
require('go').setup({
  lsp_cfg = {
    capabilities = capabilities,
    on_attach = on_attach
  }
})
local lspconfig = require('lspconfig')

lspconfig.zls.setup({
  on_attach = on_attach,
  capabilities = capabilities,

})

lspconfig.bashls.setup({
  on_attach = on_attach,
  capabilities = capabilities,
})

lspconfig.vimls.setup({
  on_attach = on_attach,
  capabilities = capabilities,
})

require 'lspconfig'.sqlls.setup({
  server = {
    on_attach = on_attach,
  }
})

-- https://github.com/nikeee/dot-language-server
-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#dotls
lspconfig['dotls'].setup({
  capabilities = capabilities,
  on_attach = on_attach,
})


lspconfig.yamlls.setup {
  settings = {
    yaml = {
      -- FIX mapKeyOrder warning
      keyOrdering = false,
    },
  }
}


lspconfig.lua_ls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  on_init = function(client)
    local path = client.workspace_folders[1].name
    if not vim.loop.fs_stat(path .. '/.luarc.json') and not vim.loop.fs_stat(path .. '/.luarc.jsonc') then
      client.config.settings = vim.tbl_deep_extend('force', client.config.settings, {
        Lua = {
          runtime = {
            -- Tell the language server which version of Lua you're using
            -- (most likely LuaJIT in the case of Neovim)
            version = 'LuaJIT'
          },
          -- Make the server aware of Neovim runtime files
          workspace = {
            checkThirdParty = false,
            library = {
              vim.env.VIMRUNTIME
              -- "${3rd}/luv/library"
              -- "${3rd}/busted/library",
            }
            -- or pull in all of 'runtimepath'. NOTE: this is a lot slower
            -- library = vim.api.nvim_get_runtime_file("", true)
          }
        }
      })

      client.notify("workspace/didChangeConfiguration", { settings = client.config.settings })
    end
    return true
  end
}

lspconfig.sqls.setup {
  on_attach = function(client, bufnr)
    require('sqls').on_attach(client, bufnr)
  end,
  sqls = {
    connections = {
      {
        driver = 'sqlite3',
        dataSourceName = '/home/algo/test.sqlite3',
      },
    },
  },
}

vim.api.nvim_create_autocmd('BufWritePre', {
  pattern = '*.go',
  callback = function()
    vim.lsp.buf.code_action({ context = { only = { 'source.organizeImports' } }, apply = true })
  end
})
