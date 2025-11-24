------------------------------------------------------------
-- Leader
------------------------------------------------------------
vim.g.mapleader = " "

------------------------------------------------------------
-- Lazy.nvim bootstrap
------------------------------------------------------------
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

------------------------------------------------------------
-- Plugins
------------------------------------------------------------
require("lazy").setup({

  ----------------------------------------------------------
  -- LSP & Tools
  ----------------------------------------------------------
  { "neovim/nvim-lspconfig" },
  { "williamboman/mason.nvim", config = true },
  { "williamboman/mason-lspconfig.nvim" },

  ----------------------------------------------------------
  -- Autocompletion
  ----------------------------------------------------------
  { "hrsh7th/nvim-cmp" },
  { "hrsh7th/cmp-nvim-lsp" },
  { "hrsh7th/cmp-buffer" },
  { "hrsh7th/cmp-path" },

  ----------------------------------------------------------
  -- Syntax / Treesitter
  ----------------------------------------------------------
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate"
  },

  ----------------------------------------------------------
  -- File explorer
  ----------------------------------------------------------
  { "nvim-tree/nvim-tree.lua" },
  { "nvim-tree/nvim-web-devicons" },

  ----------------------------------------------------------
  -- Git
  ----------------------------------------------------------
  { "lewis6991/gitsigns.nvim" },

  ----------------------------------------------------------
  -- Prisma
  ----------------------------------------------------------
  { "prisma/vim-prisma" },

  ----------------------------------------------------------
  -- UI (statusline)
  ----------------------------------------------------------
  { "nvim-lualine/lualine.nvim" },
})

------------------------------------------------------------
-- LSP Setup
local lspconfig = require("lspconfig")
------------------------------------------------------------
local capabilities = vim.lsp.protocol.make_client_capabilities()

lspconfig.ts_ls.setup({
  capabilities = capabilities,
})

-- HTML
lspconfig.html.setup({
  capabilities = capabilities,
})

-- CSS
lspconfig.cssls.setup({
  capabilities = capabilities,
})

-- JSON
lspconfig.jsonls.setup({
  capabilities = capabilities,
})

-- Prisma
lspconfig.prismals.setup({
  capabilities = capabilities,
})

------------------------------------------------------------
-- Completion (CMP)
------------------------------------------------------------
local cmp = require("cmp")
cmp.setup({
  mapping = cmp.mapping.preset.insert(),
  sources = {
    { name = "nvim_lsp" },
    { name = "buffer" },
    { name = "path" },
  },
})

------------------------------------------------------------
-- Treesitter
------------------------------------------------------------
require("nvim-treesitter.configs").setup({
  ensure_installed = { "lua", "javascript", "typescript", "tsx", "json", "html", "css", "bash", "markdown" },
  highlight = { enable = true },
})

------------------------------------------------------------
-- File explorer
------------------------------------------------------------
require("nvim-tree").setup()

------------------------------------------------------------
-- Statusline
------------------------------------------------------------
require("lualine").setup()

------------------------------------------------------------
-- Keymaps
------------------------------------------------------------
-- NvimTree
vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")

-- Basic quality of life
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.termguicolors = true

function RunCurrentFile()
  local file = vim.fn.expand("%:p")
  vim.cmd("split | terminal node " .. file)
end

vim.api.nvim_set_keymap(
  "n",
  "<leader>r",
  ":lua RunCurrentFile()<CR>",
  { noremap = true, silent = true }
)

function RunCurrentTS()
  local file = vim.fn.expand("%:p")
  vim.cmd("split | terminal ts-node " .. file)
end

vim.api.nvim_set_keymap(
  "n",
  "<leader>t",
  ":lua RunCurrentTS()<CR>",
  { noremap = true, silent = true }
)
