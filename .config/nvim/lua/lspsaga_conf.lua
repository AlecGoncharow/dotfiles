vim.g.matchup_matchparen_offscreen = { method = {} }

require('lspsaga').setup({
  ui = {
    border = 'none',
  },
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
  diagnostic = {
    show_code_action = true,
    show_layout = 'float',
    show_normal_height = 10,
    jump_num_shortcut = true,
    max_width = 0.8,
    max_height = 0.6,
    max_show_width = 0.9,
    max_show_height = 0.6,
    text_hl_follow = true,
    border_follow = true,
    wrap_long_lines = true,
    extend_relatedInformation = false,
    diagnostic_only_current = false,
    keys = {
      exec_action = 'o',
      quit = 'q',
      toggle_or_jump = '<CR>',
      quit_in_show = { 'q', '<ESC>' },
    },
  },
  code_action = {
    num_shortcut = true,
    show_server_name = false,
    extend_gitsigns = true,
    only_in_cursor = false,
    max_height = 0.3,
    keys = {
      quit = { 'q', '<ESC>' },
      exec = '<CR>',
    },
  },
})

Nmap('<c-d>', ':Lspsaga outline<CR>')
Nmap('<c-e>', ':Lspsaga show_buf_diagnostics<CR>')
Nmap('<c-a>', ':Lspsaga code_action<CR>')


Nmap('t', ':Lspsaga term_toggle<CR>')
