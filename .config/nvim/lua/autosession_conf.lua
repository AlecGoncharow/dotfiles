function string.starts(String, Start)
  return string.sub(String, 1, string.len(Start)) == Start
end

-- for reasons beyond my comprehension, sessions get corrupted whenever a term buffer is left open, so let's just close all term to minimize friction
local function close_term_bufs()
  for _, buf_hndl in ipairs(vim.api.nvim_list_bufs()) do
    local name = vim.api.nvim_buf_get_name(buf_hndl)
    if string.starts(name, "term://") then
      vim.api.nvim_buf_delete(buf_hndl, { force = true })
    end
  end
end

local opts = {
  log_level = 'error',
  auto_session_enable_last_session = false,
  auto_session_root_dir = vim.fn.stdpath('data') .. "/sessions/",
  auto_session_enabled = true,
  auto_save_enabled = true,
  auto_restore_enabled = true,
  auto_session_suppress_dirs = { "~/", "~/Downloads", "/" },
  auto_session_use_git_branch = nil,
  -- the configs below are lua only
  bypass_session_save_file_types = nil,
  cwd_change_handling = {            -- table: Config for handling the DirChangePre and DirChanged autocmds, can be set to nil to disable altogether
    restore_upcoming_session = true, -- boolean: restore session for upcoming cwd on cwd change
    pre_cwd_changed_hook = nil,      -- function: This is called after auto_session code runs for the `DirChangedPre` autocmd
    post_cwd_changed_hook = nil,     -- function: This is called after auto_session code runs for the `DirChanged` autocmd
  },
  pre_save_cmds = { close_term_bufs }
}

vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"

require('auto-session').setup(opts)
