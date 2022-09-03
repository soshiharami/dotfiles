vim.cmd[[packadd packer.nvim]]

require'packer'.startup(function()
  -- 起動時に読み込むプラグインは名前を書くだけです
  use'tpope/vim-fugitive'
  use'tpope/vim-repeat'
   use "lukas-reineke/lsp-format.nvim"

  -- theme
  use "projekt0n/github-nvim-theme"

  -- tree
  use {
    'kyazdani42/nvim-tree.lua',
    requires = 'kyazdani42/nvim-web-devicons',
    config = function() require'nvim-tree'.setup {}
    end
  }

  -- opt オプションを付けると遅延読み込みになります。
  -- この場合は opt だけで読み込む契機を指定していないため、
  -- `packadd` コマンドを叩かない限り読み込まれることはありません。
  use{'wbthomason/packer.nvim', opt = true}
  -- packer.nvim 自体を遅延読み込みにする理由はまた後ほど。

  -- コマンドを叩いたときに読み込む。
  use{'rhysd/git-messenger.vim', opt = true, cmd = {'GitMessenger'}}

  -- 特定のイベントで読み込む
  use{'tpope/vim-unimpaired', opt = true, event = {'FocusLost', 'CursorHold'}}

  -- 特定のファイルタイプのファイルを開いたら読み込む
  use{'fatih/vim-go', opt = true, ft = {'go'}}

  -- 特定のキーを叩いたら読み込む
  -- この例ではノーマルモードの <CR> にマッピングしていますが、
  -- モードを指定する場合はテーブルを入れ子にします。
  -- keys = {
  --   {'n', '<CR>'},
  --   {'v', '<CR>'},
  -- }
  use{
    'arecarn/vim-fold-cycle',
    opt = true,
    keys = {'<CR>'},
  }

  -- 特定の VimL 関数を呼ぶと読み込む
  -- この例だと、任意の場所で Artify('hoge', 'bold') のように呼び出された時に、
  -- このプラグインも読み込まれます。
  use{'sainnhe/artify.vim', opt = true, fn = {'Artify'}}

  -- 実は opt = true は省略できます。読み込む契機（この例では cmd）を指定すると、
  -- 自動的に遅延読み込みとみなされます。
  use{
    'npxbr/glow.nvim',
    cmd = {'Glow', 'GlowInstall'},
    -- run オプションを指定すると、インストール時・更新時に
    -- 実行するコマンドを指定できます。
    run = [[:GlowInstall]],
    -- 先頭に : がついていないなら bash -c '...' で実行されます。
    -- run = [[npm install]],
    -- 関数も指定可能です。
    -- run = function() vim.cmd[[GlowInstall]] end,
  }

  -- 条件が真の時のみ読み込みます。条件は起動時に毎回判定されます。
  use{
    'thinca/vim-fontzoom',
    cond = [[vim.fn.has'gui' == 1]], -- GUI の時のみ読み込む。
    -- 関数も指定できます。
    -- conf = function() return vim.fn.has'gui' == 1 end,
  }

  use { "ellisonleao/gruvbox.nvim" }

  -- 依存関係も管理できます。vim-prettyprint は
  -- capture.vim が読み込まれる前に、自動的に packadd されます。
  use{
    'tyru/capture.vim',
    requires = {
      {'thinca/vim-prettyprint', cmd = {'PP', 'PrettyPrint'}},
    },
    cmd = {'Capture'},
  }

  use "neovim/nvim-lspconfig"
  use { "jose-elias-alvarez/null-ls.nvim", requires = { "nvim-lua/plenary.nvim" } }
  use "williamboman/nvim-lsp-installer"
  use "hrsh7th/nvim-cmp"
  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/cmp-vsnip"
  use "hrsh7th/cmp-buffer"
  use "hrsh7th/vim-vsnip"
  use 'voldikss/vim-floaterm'
  use{'scalameta/nvim-metals', requires = { "nvim-lua/plenary.nvim" }}
  vim.cmd [[augroup lsp]]
  vim.cmd [[au!]]
  vim.cmd [[au FileType scala,sbt lua require("metals").initialize_or_attach({})]]
  vim.cmd [[augroup end]]

  if packer_bootstrap then
    require("packer").sync()
  end
vim.cmd([[autocmd BufWritePost init.lua source <afile> | PackerCompile]])

local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end

  local opts = { noremap=true, silent=true }
  buf_set_keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
  buf_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
  buf_set_keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
  buf_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
  buf_set_keymap("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
  buf_set_keymap("n", "<space>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opts)
  buf_set_keymap("n", "<space>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)
  buf_set_keymap("n", "<space>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", opts)
  buf_set_keymap("n", "<space>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
  buf_set_keymap("n", "<space>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
  buf_set_keymap("n", "<space>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
  buf_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
  buf_set_keymap("n", "<space>e", "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>", opts)
  buf_set_keymap("n", "<C-p>", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", opts)
  buf_set_keymap("n", "<C-n>", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", opts)
  buf_set_keymap("n", "<space>q", "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>", opts)
  buf_set_keymap("n", "fn", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)


    if client.resolved_capabilities.document_formatting then
        vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()")
    end

end

local lsp_installer = require("nvim-lsp-installer")
lsp_installer.on_server_ready(function(server)
    local opts = {}
    opts.on_attach = on_attach
    opts.capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())

    server:setup(opts)
    vim.cmd [[ do User LspAttachBuffers ]]

vim.opt.completeopt = "menu,menuone,noselect"

local cmp = require"cmp"
cmp.setup({
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  mapping = {
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ["<C-d>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<C-e>"] = cmp.mapping.close(),
    ["<CR>"] = cmp.mapping.confirm({ select = true }),
  },
  sources = cmp.config.sources({
    { name = "nvim_lsp" },
    { name = "vsnip" },
  }, {
    { name = "buffer" },
  })
})

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local null_ls = require "null-ls"
null_ls.setup {
     -- you can reuse a shared lspconfig on_attach callback here
    on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
            vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
            vim.api.nvim_create_autocmd("BufWritePre", {
                group = augroup,
                buffer = bufnr,
                callback = function()
                    -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
                    vim.lsp.buf.formatting_sync()
                end,
            })
        end
    end,
  sources = {
    null_ls.builtins.formatting.prettier.with {
      prefer_local = "node_modules/.bin",
    },
  },
}

end)
end)

require("lsp-format").setup {}
require "lspconfig".gopls.setup {
    on_attach = require "lsp-format".on_attach
}

--theme
require('github-theme').setup({
  theme_style = "dark",
  function_style = "italic",
  sidebars = {"qf", "vista_kind", "terminal", "packer"},

  -- Change the "hint" color to the "orange" color, and make the "error" color bright red
  colors = {hint = "orange", error = "#ff0000"}
})
