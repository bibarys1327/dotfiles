return {
  "neovim/nvim-lspconfig",

  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "hrsh7th/cmp-nvim-lsp",
  },

  config = function()
    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    require("mason").setup()
    require("mason-lspconfig").setup({
      ensure_installed = {
        "tsserver",
        "html",
        "cssls",
        "jsonls",
        "eslint",
        "lua_ls",
      },
    })

    local servers = {
      tsserver = "ts_ls",  -- tsserver в Mason → ts_ls в vim.lsp.config
      html = "html",
      cssls = "cssls",
      jsonls = "jsonls",
      eslint = "eslint",
      lua_ls = "lua_ls",
    }

    for mason_name, lsp_name in pairs(servers) do
      vim.lsp.config[lsp_name].setup({
        capabilities = capabilities,
      })
    end

    -- Lua LSP настройки
    vim.lsp.config.lua_ls.setup({
      settings = {
        Lua = {
          diagnostics = { globals = { "vim" } },
          workspace = { library = vim.api.nvim_get_runtime_file("", true) },
        },
      },
    })
  end,
}