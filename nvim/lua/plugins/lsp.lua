return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "hrsh7h/cmp-nvim-lsp",
  },

  config = function()
    local lspconfig = require("lspconfig")
    local capabilities = require("cmp_nvim_lsp").default_capabilities()
    
    require("mason").setup()


require("mason-lspconfig").setup({
  ensure_installed={
    "ts_ls",
    "html",
    "cssls",
    "jsonls",
    "eslint",
    "lua_ls",
  }
})

local servers = {
	"ts_ls",
	"html",
	"cssls",
	"jsonls",
	"eslint",
	"lua_ls",
}

for _, s in ipairs(servers) do
  lspconfig[s].setup({
		capabilities = capabilities
	})
end

lspconfig.lua_ls.setup({
	settings = {
		Lua = {
			diagnostics = {globals={"vim"}},
			workspace = {library = vim.api.nvim_get_runtime_file("",true)},
		}
	}
})
