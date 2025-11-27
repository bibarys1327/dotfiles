return {
  "nvim-treesitter/nvim-treesitter",

  build = ":TSUpdate",

  config = function()

require("nvim-treesitter.configs").setup({
	ensure_installed = {
		"javascript","typescript","tsx","lua","json","css","html","bash"
	},
	highlight = {enable=true},
})
end,
}
