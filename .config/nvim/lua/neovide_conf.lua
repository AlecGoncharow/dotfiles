vim.g.neovide_transparency = 0.95
-- vim.g.neovide_refresh_rate = 144
-- vim.g.neovide_cursor_vfx_mode = 'wireframe'
vim.g.neovide_cursor_animation_length = 0.03
vim.g.neovide_cursor_trail_size = 0.9
vim.g.neovide_scroll_animation_length = 0.3
-- vim.g.neovide_scroll_animation_far_lines = 9999
-- vim.g.neovide_unlink_border_highlights = true
vim.o.guifont = "Fira Mono:h13"

vim.cmd([[
  " ### Transparency ###
  hi Normal guibg=#062625
  hi LineNr guibg=#062625
  hi Folded guibg=#062625
  hi NonText guibg=#062625
  hi SpecialKey guibg=#062625
  hi VertSplit guibg=#062625
  hi SignColumn guibg=#062625
  hi EndOfBuffer guibg=#062625
  ]])
