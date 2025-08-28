return {
  {
    "stevearc/conform.nvim",
    config = function()
      require("conform").setup({
        formatters_by_ft = {
          lua = {"stylua"},
          javascript = {"prettierd", "prettier" },
          typescript = {"prettierd", "prettier" },
          json = {"prettierd", "prettier" },
          yaml = {"prettierd", "prettier" },
          markdown = {"prettierd", "prettier" },
        },
      })
    end,
  },
}

