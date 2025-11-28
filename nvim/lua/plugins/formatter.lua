{
  "nvimtools/none-ls.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local null = require("null-ls")

    null.setup({
      sources = {
        -- форматтеры
        null.builtins.formatting.prettier,
        null.builtins.formatting.stylua,

        -- линтеры
        null.builtins.diagnostics.eslint,
      },
    })
  end,
}