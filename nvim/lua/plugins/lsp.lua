return {
  "neovim/nvim-lspconfig",

  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "hrsh7th/cmp-nvim-lsp",
  },

  config = function()
    local capabilities = require("cmp_nvim_lsp").default_capabilities()
    local lsp_config = vim.lsp.config

    require("mason").setup()

    -- Правильные имена серверов в Neovim 0.11
    require("mason-lspconfig").setup({
      ensure_installed = {
        "ts_ls",
        "html",
        "cssls",
        "jsonls",
        "eslint",
        "lua_ls",
      },
    })

    -- Список серверов
    local servers = {
      "ts_ls",
      "html",
      "cssls",
      "jsonls",
      "eslint",
      "lua_ls",
    }

    -- Подключаем сервера
    for _, server in ipairs(servers) do
      lsp_config(server, {
        capabilities = capabilities,
      })
    end

    -- Отдельные настройки Lua LSP
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