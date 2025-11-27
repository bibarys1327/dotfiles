return {
  "folke/tokyonight.nvim",

  config = function()
    vim.cmd("colorscheme tokyonight")
    require("lualine").setup()
  end,
}
