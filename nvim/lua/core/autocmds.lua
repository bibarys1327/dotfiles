local aug = vim.api.nvim_create_augroup
local au = vim.api.nvim_create_autocmd

au("TextYankPost", {
  group = aug("YankHighlight", { clear = true }),
  callback = function() vim.highlight.on_yank() end,
})

au("BufWritePre", {
  group = aug("FormatOnSave", { clear = true }),
  callback = function()
    require("conform").format({ lsp_fallback = true, async = false, timeout_ms = 2000 })
  end,
})




