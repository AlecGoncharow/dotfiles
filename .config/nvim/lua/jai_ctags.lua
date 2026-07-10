local group = vim.api.nvim_create_augroup('JaiCtags', { clear = true })

-- Auto-update tags on save
vim.api.nvim_create_autocmd('BufWritePost', {
  group = group,
  pattern = '*.jai',
  callback = function()
    -- Run ctags asynchronously so it doesn't block the editor
    -- Exclude maze-rs, how_to, and intermediate directories to keep the tags file clean
    vim.fn.jobstart({"ctags", "-R", "--exclude=maze-rs", "--exclude=how_to", "--exclude=.build", "--exclude=bin", "."}, {
      detach = true,
      on_exit = function()
        -- Post-process the tags file to completely strip \ and whitespace from Jai identifiers
        vim.fn.jobstart({"perl", "-i", "-F\\t", "-lane", "if ($F[0] !~ /^!_TAG_/) { $F[0] =~ s/[\\\\\\s]+//g; print join(\"\\t\", @F) } else { print $_ }", "tags"})
      end
    })
  end
})

-- Dynamic keymaps for Jai
local function get_normalized_jai_identifier()
    local line = vim.api.nvim_get_current_line()
    local col = vim.api.nvim_win_get_cursor(0)[2] + 1
    
    local idents = {}
    local i = 1
    while i <= #line do
        local c = line:sub(i, i)
        if c:match("[%a_]") then
            local start_idx = i
            local j = i + 1
            while j <= #line do
                local c2 = line:sub(j, j)
                if c2:match("[%w_]") then
                    j = j + 1
                elseif c2 == "\\" then
                    local k = j + 1
                    while k <= #line and line:sub(k, k):match("[ \t]") do
                        k = k + 1
                    end
                    if k <= #line and line:sub(k, k):match("[%w_]") then
                        j = k
                    else
                        break
                    end
                else
                    break
                end
            end
            table.insert(idents, { text = line:sub(start_idx, j - 1), s = start_idx, e = j - 1 })
            i = j
        else
            i = i + 1
        end
    end
    
    for _, id in ipairs(idents) do
        if col >= id.s and col <= id.e then
            return id.text:gsub("\\", ""):gsub(" ", ""):gsub("\t", "")
        end
    end
    return vim.fn.expand('<cword>')
end

vim.api.nvim_create_autocmd('FileType', {
  group = group,
  pattern = 'jai',
  callback = function(opts)
    -- Map gd to use native ctags jump but passing the smartly parsed identifier
    vim.keymap.set('n', 'gd', function() 
        local word = get_normalized_jai_identifier()
        if word ~= "" then vim.cmd("tag " .. word) end
    end, { buffer = opts.buf, noremap = true, silent = true, desc = "Goto Definition (Ctags)" })
    
    -- Also map <space>D if you use that occasionally
    vim.keymap.set('n', '<space>D', function() 
        local word = get_normalized_jai_identifier()
        if word ~= "" then vim.cmd("tag " .. word) end
    end, { buffer = opts.buf, noremap = true, silent = true, desc = "Goto Type Definition (Ctags)" })
    
    -- Map <leader>d to fzf-lua tags for when you need to pick from multiple matches
    vim.keymap.set('n', '<leader>d', function() 
        require('fzf-lua').tags({ query = get_normalized_jai_identifier() }) 
    end, { buffer = opts.buf, noremap = true, silent = true, desc = "Goto Definition Menu (fzf tags)" })
    
    -- Map gr to fzf-lua grep but with a smart regex that handles Jai's split identifiers (e.g. \ followed by spaces)
    vim.keymap.set('n', 'gr', function()
        local word = get_normalized_jai_identifier()
        if not word or word == "" then return end
        local chars = {}
        for i = 1, #word do
            table.insert(chars, word:sub(i, i))
        end
        -- Creates a regex like f[ \t\\]*r[ \t\\]*e... to match free\ _site_trace
        -- We use [ \t\\]* instead of PCRE non-capturing groups because fzf-lua feeds the regex
        -- into Neovim's internal NFA engine for highlighting, which crashes on (?:...).
        local regex = table.concat(chars, [[[ \t\\]*]])
        require('fzf-lua').grep({ search = regex, no_esc = true, prompt = 'Jai References> ' })
    end, { buffer = opts.buf, noremap = true, silent = true, desc = "Goto References (fzf-lua)" })
    
    -- Configure gf to seamlessly jump into module directories
    vim.opt_local.path:append("./modules")
    vim.opt_local.path:append(vim.fn.expand("~") .. "/jai/modules")
    vim.opt_local.suffixesadd:append(".jai")
    vim.opt_local.suffixesadd:append("/module.jai")
    
    -- Build configuration
    -- Make <leader>b run the Jai compiler and automatically open the quickfix window if there are errors!
    vim.opt_local.makeprg = "jai build.jai - src/main.jai"
    vim.opt_local.errorformat = '%f:%l\\,%c:\\ %m,%f:%l:\\ %m'
    vim.keymap.set('n', '<leader>b', '<cmd>make<cr><cmd>cwindow<cr>', { buffer = opts.buf, noremap = true, silent = true, desc = "Build Jai Program" })

    -- Make <leader>r build and run if successful
    vim.keymap.set('n', '<leader>r', function()
        vim.cmd('make')
        vim.cmd('cwindow')
        
        -- Check if there are any valid errors in the quickfix list
        local has_errors = false
        for _, item in ipairs(vim.fn.getqflist()) do
            if item.valid == 1 then
                has_errors = true
                break
            end
        end

        if not has_errors then
            vim.cmd('botright 15split | term ./bin/main')
            vim.cmd('startinsert')
        end
    end, { buffer = opts.buf, noremap = true, silent = true, desc = "Build and Run Jai Program" })

    -- Auto-build on save if Quickfix window is open (we are in fix-mode)
    vim.api.nvim_create_autocmd("BufWritePost", {
        buffer = opts.buf,
        callback = function()
            local qf_open = false
            for _, win in ipairs(vim.api.nvim_tabpage_list_wins(0)) do
                local buf = vim.api.nvim_win_get_buf(win)
                if vim.bo[buf].buftype == 'quickfix' then
                    qf_open = true
                    break
                end
            end
            if qf_open then
                vim.cmd('make')
                vim.cmd('cwindow')
            end
        end,
    })
  end
})
