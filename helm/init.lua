--Leader
vim.g.mapleader=" "

-- Disable netrw (nvim-tree optimization)

vim.g.loaded_netrw=1
vim.g.loaded_netrwPlugin=1

-- Lazy.nvim bootstrap

local lazypath=vim.fn.stdpath("data").."/lazy/lazy.nvim"
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

-- Plugins
require("lazy").setup({
-- LSP & Tools
{"neovim/nvim-lspconfig"},
{"williamboman/mason.nvim", config=true},
{"williamboman/mason-lspconfig.nvim"},

-- Autocompletion
{"hrsh7th/nvim-cmp"},
{"hrsh7th/cmp-nvim-lsp"},
{"hrsh7th/cmp-buffer"},
{"hrsh7th/cmp-path"},

-- Syntax / Treesitter
{
	"nvim-treesitter/nvim-treesitter",
	build=":TSUpdate"
},

-- UI
{"nvim-lualine/lualine.nvim"},
{"nvim-tree/nvim-tree.lua"},
{"nvim-tree/nvim-web-devicons"},
{"folke/tokyonight.nvim"},

-- Git
{"lewis6991/gitsigns.nvim"},

-- Comments
{"numToStr/Comment.nvim"},

-- Autopairs
{"windwp/nvim-autopairs"},

-- Prisma
{"prisma/vim-prisma"},
})

-- LSP Setup
local lspconfig=require("lspconfig")
local capabilities=require("cmp_nvim_lsp").default_capabilities()

-- TypeScript
lspconfig.tsserver.setup({capabilities=capabilities})

-- HTML
lspconfig.html.setup({capabilities=capabilities})

-- CSS
lspconfig.cssls.setup({capabilities=capabilities})

-- JSON
lspconfig.jsonls.setup({capabilities=capabilities})

-- Prisma
lspconfig.prismals.setup({capabilities=capabilities})

-- Completion (CMP)
local cmp=require("cmp")
cmp.setup({
	mapping=cmp.mapping.preset.insert(),
	sources={
		{name="nvim_lsp"},
		{name="buffer"},
		{name="path"},
	},
})

-- Treesitter
require("nvim-treesitter.configs").setup({
	ensure_installed={
		"lua","javascript","typescript","tsx",
		"json","html","css","bash","markdown"
	},
	highlight={enable=true},
})

-- UI Setup
vim.cmd([[colorscheme tokyonight]])
require("nvim-tree").setup()
require("lualine").setup()
require("gitsigns").setup()
require("Comment").setup()
require("nvim-autopairs").setup()

-- Keymaps

-- NvimTree toggle
vim.keymap.set("n", "<leader>e",":NvimTreeToggle<CR>")

-- Run JS/TS files
function RunCurrentFile()
	local file=vim.fn.expand("%:p")
	vim.cmd("split } terminal node "..file)
end

vim.keymap.set("n","<leader>r",":lua RunCurrentFile()<CR>",{silent=true})

function RunCurrentTS()
	local file=vim.fn.expand("%:p")
	vim.cmd("split | terminal ts-node "..file)
end

vim.keymap.set("n","<leader>t",":lua RunCurrentTS()<CR>",{silent=true})

-- Basic options
vim.opt.number=true
vim.opt.relativenumber=true
vim.opt.cursorline=true

vim.opt.tabstop=2
vim.opt.shiftwidth=2
vim.opt.expandtab=true

vim.opt.splitright=true
vim.opt.splitbelow=true

vim.opt.termguicolors=true
vim.opt.updatetime=200
vim.opt.timeoutlen=400
vim.opt.wrap=false
