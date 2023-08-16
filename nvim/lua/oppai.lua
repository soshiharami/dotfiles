local builtinn = require('telescope.builtin')
vim.keymap.set('n', 'mf', builtinn.find_files, {})
vim.keymap.set('n', 'mg', builtinn.live_grep, {})
vim.keymap.set('n', 'mb', builtinn.buffers, {})
