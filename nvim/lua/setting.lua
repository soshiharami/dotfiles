vim.api.nvim_command('set autoindent')
vim.api.nvim_command('set smartindent')
vim.api.nvim_command('set expandtab')
vim.api.nvim_command('set encoding=utf-8')
vim.api.nvim_command('set fileencoding=utf-8')
vim.api.nvim_command('set tabstop=4')
vim.api.nvim_command('set shiftwidth=4')
vim.api.nvim_command('set cursorline')
vim.api.nvim_command('set number')
vim.api.nvim_command('set showmode')
vim.api.nvim_command('set showmatch')
vim.api.nvim_command('set title')
vim.api.nvim_command('set backspace=indent,eol,start')
vim.api.nvim_command('set inccommand=split')
vim.api.nvim_command('set hidden')
vim.api.nvim_command('set nobackup')
vim.api.nvim_command('set nowritebackup')
vim.api.nvim_command('set conceallevel=0')
vim.api.nvim_command('set clipboard+=unnamedplus')
vim.api.nvim_command('set list')

vim.api.nvim_command('autocmd BufWritePre *.ts EslintFixAll')


vim.opt.background = "dark" 
vim.cmd([[colorscheme gruvbox]])
