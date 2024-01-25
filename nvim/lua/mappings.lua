local map = vim.api.nvim_set_keymap
options = { noremap = tre }

map("n", "<Space>", "", {})
vim.g.mapleader = " " -- 'vim.g' sets global variables

map("n", ";", ":", options)
map("n", "<leader>tw", "<cmd>set wrap!<CR>", options)
map("n", "=a", "gg=G``", options)
map("n", "<leader>x", "<cmd>bd<CR>", options)
map("n", "mf", ":?{<CR>zf%:noh<CR>", options)
map("n", "df", "zd", options)
map("i", "jk", "<ESC>", { nowait = true, noremap = true })
map("i", "<C-<BS>>", "<ESC>caw", { nowait = true, noremap = true })

-- map('n', '<leader>ff', "Telescope find_files", {})
-- map('n', '<leader>fg', builtin.live_grep, {})
-- map('n', '<leader>fb', builtin.buffers, {})
-- map('n', '<leader>fh', builtin.help_tags, {})
