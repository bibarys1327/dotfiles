local map = vim.keymap.set
local opts = { noremap = true, silent = true }

map("n", "<leader>w", "<cmd>w<cr>", opts)
map("n", "<leader>q", "<cmd>q<cr>", opts)
map("n", "<leader>Q", "<cmd>qa!<cr>", opts)
map("n", "<leader>h", "<cmd>nohlsearch<cr>", opts)

map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-k>", "<C-w>k", opts)
map("n", "<C-l>", "<C-w>l", opts)

map("n", "<S-l>", "<cmd>bnext<cr>", opts)
map("n", "<S-h>", "<cmd>bprevious<cr>", opts)
map("n", "<leader>bd", "<cmd>bdelete<cr>", opts)

map("n", "<leader>ff", "<cmd>Telescope find_files<cr>", opts)
map("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", opts)
map("n", "<leader>fb", "<cmd>Telescope buffers<cr>", opts)
map("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", opts)
map("n", "<leader>fs", "<cmd>Telescope lsp_document_symbols<cr>", opts)

map("n", "<leader>e", "<cmd>Neotree toggle<cr>", opts)
map("n", "<leader>E", "<cmd>Neotree float toggle<cr>", opts)

map("n", "gd", vim.lsp.buf.definition, opts)
map("n", "gr", vim.lsp.buf.references, opts)
map("n", "gI", vim.lsp.buf.implementation, opts)
map("n", "K", vim.lsp.buf.hover, opts)

map("n", "<leader>rn", vim.lsp.buf.rename, opts)
map("n", "<leader>ca", vim.lsp.buf.code_action, opts)
map("n", "<leader>fd", function() vim.diagnostic.open_float() end, opts)

map("n", "[d", vim.diagnostic.goto_prev, opts)
map("n", "]d", vim.diagnostic.goto_next, opts)

map({ "n", "v" }, "<leader>fm", function()
  require("conform").format({ lsp_fallback = true, async = false })
end, opts)

map("n", "<leader>gg", "<cmd>LazyGit<cr>", opts)

map("n", "<F5>", function() require('dap').continue() end, opts)
map("n", "<F10>", function() require('dap').step_over() end, opts)
map("n", "<F11>", function() require('dap').step_into() end, opts)
map("n", "<F12>", function() require('dap').step_out() end, opts)
map("n", "<leader>db", function() require('dap').toggle_breakpoint() end, opts)
map("n", "<leader>du", function() require('dapui').toggle() end, opts)
