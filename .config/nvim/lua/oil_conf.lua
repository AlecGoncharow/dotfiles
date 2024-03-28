require("oil").setup()
-- act like vim-vinegar
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
