local function my_on_attach(bufnr)
  local api = require "nvim-tree.api"

  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  -- default mappings
  api.config.mappings.default_on_attach(bufnr)

  -- custom mappings
  vim.keymap.set('n', '<C-t>', api.tree.change_root_to_parent,        opts('Up'))
  vim.keymap.set('n', 'o',     api.node.open.edit,                    opts('Open'))
  vim.keymap.set('n', '?',     api.tree.toggle_help,                  opts('Help'))
  vim.keymap.set('n', 'e',     api.node.open.vertical,                  opts('Help'))
  vim.keymap.set('n', 'R',     api.fs.rename,                         opts('Rename'))
  vim.keymap.set('n', 'r',     api.fs.remove,                  opts('Help'))
  vim.keymap.set('n', 'C',     api.fs.create,                  opts('Help'))

    vim.keymap.del('n', 'O', { buffer = bufnr })
    vim.keymap.del('n', 'a', { buffer = bufnr })
    vim.keymap.del('n', 's', { buffer = bufnr })
    vim.keymap.del('n', 'd', { buffer = bufnr })
end

require'nvim-tree'.setup ({
  on_attach = my_on_attach,
},
vim.cmd[[autocmd VimEnter * execute 'NvimTreeOpen']])


