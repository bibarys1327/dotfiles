return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      require("nvim-treesitter.configs").setup({
        highlight = { enable = true },
        indent = { enable = true },
        ensure_installed = {
          "lua", "javascript", "typescript", "tsx",
          "json", "yaml", "dockerfile", "bash", "markdown", "css"
        },
      })
    end,
  }
}
