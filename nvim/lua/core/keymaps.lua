local map=vim.keymap.set
map("n","<Space>","",{})
vim.g.mapleader=" "

map("n","<leader>e",":NvimTreeToggle<CR>")
map("n","<leader>ff",":Telescope find_files<CR>")
map("n","<leader>fg",":Telescope live_grep<CR>")
