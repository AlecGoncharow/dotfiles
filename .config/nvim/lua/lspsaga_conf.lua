vim.g.matchup_matchparen_offscreen = { method = {} }

require('lspsaga').setup({
  outline = {
    win_position = 'right',
    auto_preview = true,
    detail = true,
    auto_close = true,
    close_after_jump = true,
    layout = 'float',
    keys = {
      toggle_or_jump = '<cr>',
      quit = 'q',
      jump = 'e',
    },
  },
})

Nmap('<c-d>', ':Lspsaga outline<CR>')
