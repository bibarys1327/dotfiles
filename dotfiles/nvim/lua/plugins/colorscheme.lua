return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    coonfig = function()
      require("catppuccin").setup({
        flavour = "macchiato",
        integrations = {
          telescope = true,
          treesitter = true,
          cmp = true,
          gitsigns = true,
          neotree = true,
          dap = true,
        },
      })
      vim.cmd.colorscheme("catppuccin-macchiato")
    end,
  },
}
