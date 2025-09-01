vim.g.mapleader = " "
vim.g.maplocalleader = " "

require("core.options")
require("core.keymaps")
require("core.autocmds")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git", "clone", "--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", lazypath
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins",{
	change_detection = {notify = false },
	ui = { border = "rounded" },
	install = { colorscheme = { "catppuccin" }},
})

vim.cmd.colorscheme("catppuccin-macchiato")
