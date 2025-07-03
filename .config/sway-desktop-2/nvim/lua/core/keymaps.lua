vim.g.mapleader = " "

vim.o.relativenumber = true
vim.o.number = true
vim.opt.clipboard = 'unnamedplus'

vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.api.nvim_set_keymap('n', '<C-s>', ':w<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<C-s>', '<C-o>:w<CR>', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<C-w>', ':bd<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<C-w>', '<C-o>:bd<CR>', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<C-q>', ':q<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<C-q>', '<C-o>:q<CR>', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<C-t>', ':terminal<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<C-t>', '<C-o>:terminal<CR>', { noremap = true, silent = true })

vim.g.user_emmet_leader_key = '<C-x>'

vim.api.nvim_set_keymap('n', '<Space>co', '<cmd>lua require("Comment.api").toggle.linewise.current()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<Space>co', '<esc><cmd>lua require("Comment.api").toggle.linewise(vim.fn.visualmode())<CR>', { noremap = true, silent = true })

-- This keybinding uses jk as the escape key to exit a mode
-- vim.api.nvim_set_keymap("i", "jk", "<ESC>", {noremap = true})

-- This keymap clears search
-- vim.keymap.set("n", "<leader>h", ":nohlsearch<CR>")

