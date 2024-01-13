vim.g.matchup_matchparen_offscreen = { method = {} }

require('lspsaga').setup({
  ui = {
    border = 'single',
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
  finder = {
    max_height = 0.5,
    left_width = 0.4,
    methods = {},
    default = 'ref+imp',
    layout = 'float',
    silent = false,
    filter = {},
    fname_sub = nil,
    sp_inexist = false,
    sp_global = false,
    ly_botright = false,
    keys = {
      shuttle = '[w',
      toggle_or_open = '<CR>',
      vsplit = 's',
      split = 'i',
      tabe = 't',
      tabnew = 'r',
      quit = { 'q', '<ESC>' },
      close = '<C-c>k',
    },
  },
  definition = {
    width = 0.6,
    height = 0.5,
    save_pos = false,
    keys = {
      edit = '<C-c>o',
      vsplit = '<C-c>v',
      split = '<C-c>i',
      tabe = '<C-c>t',
      tabnew = '<C-c>n',
      quit = { 'q', '<ESC>' },
      close = '<C-c>k',
    },
  },
})

Nmap('<c-e>', ':Lspsaga outline<CR>')
Nmap('<c-d>', ':Lspsaga show_buf_diagnostics<CR>')
Nmap('<c-a>', ':Lspsaga code_action<CR>')
Nmap('<leader>ca', ':Lspsaga code_action<CR>')
Nmap('gr', ':Lspsaga finder ref<CR>')
Nmap('gi', ':Lspsaga finder imp<CR>')
Nmap('gd', ':Lspsaga goto_definition<CR>')
Nmap('gD', ':Lspsaga goto_type_definition<CR>')
