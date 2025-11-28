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

    -- Соответствие Mason → LSP names
    local servers = {
      tsserver = "ts_ls",  -- новое имя в Neovim 0.11
      html = "html",
      cssls = "cssls",
      jsonls = "jsonls",
      eslint = "eslint",
      lua_ls = "lua_ls",
    }

    local lsp_config = vim.lsp.config

    -- Подключаем все сервера
    for mason_name, lsp_name in pairs(servers) do
      lsp_config(lsp_name, {
        capabilities = capabilities,
      })
    end

    -- Отдельные настройки Lua
    lsp_config("lua_ls", {
      capabilities = capabilities,
      settings = {
        Lua = {
          diagnostics = { globals = { "vim" } },
          workspace = {
            library = vim.api.nvim_get_runtime_file("", true),
            checkThirdParty = false,
          },
        },
      },
    })
  end,
}