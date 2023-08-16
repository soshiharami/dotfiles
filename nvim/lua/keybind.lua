vim.api.nvim_set_keymap("i", "ff", "<Esc>", { noremap = true })

vim.api.nvim_set_keymap("", "w", "k", { noremap = true })
vim.api.nvim_set_keymap("", "a", "h", { noremap = true })
vim.api.nvim_set_keymap("", "s", "j", { noremap = true })
vim.api.nvim_set_keymap("", "d", "l", { noremap = true })

vim.api.nvim_set_keymap("n", "OW", "<C-w>k", { noremap = true })
vim.api.nvim_set_keymap("n", "OA", "<C-w>h", { noremap = true })
vim.api.nvim_set_keymap("n", "OS", "<C-w>j", { noremap = true })
vim.api.nvim_set_keymap("n", "OD", "<C-w>l", { noremap = true })

vim.api.nvim_set_keymap("n", "q", "a", { noremap = true })
vim.api.nvim_set_keymap("n", "ee", "dd", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-s>", "w", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-w>", "b", { noremap = true })

vim.api.nvim_set_keymap("", "x", "x", { noremap = true })


vim.api.nvim_set_keymap("", "lg", ":FloatermNew lazygit<CR>", { noremap = true })
