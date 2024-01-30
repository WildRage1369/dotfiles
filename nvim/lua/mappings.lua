function map_key(mode, lhs, rhs, dsc, nw)
    nw = nw or false
    dsc = dsc or ""
    vim.api.nvim_set_keymap(mode, lhs, rhs, { desc = dsc, nowait = nw, noremap = true })
end

map_key("n", "<Space>", "")
vim.g.mapleader = " " -- 'vim.g' sets global variables

map_key(
    "n",
    "<leader>fm",
    ":lua MiniFiles.open(vim.api.nvim_buf_get_name(0))<CR>",
    "Open mini.files at buffer location"
)
map_key("n", "<leader>tw", "<cmd>set wrap!<CR>", "Toggle Wrap")
map_key("n", "<leader>x", "<cmd>bd<CR>", "Close tab")
map_key("i", "<C-<BS>>", "<ESC>caw", "Delete word behind cursor", true)
map_key("i", "jk", "<ESC>", "Exist insert mode", true)
map_key("i", "<Up>", "<C-o>gk")
map_key("i", "<Down>", "<C-o>gj")
map_key("n", "mf", ":?{<CR>zf%:noh<CR>", "Find previous '{' and create fold there")
map_key("n", "=a", "gg=G``", "Format all")
map_key("n", "df", "zd", "Delete fold")
map_key("n", "<leader>pp", ":lua require('nabla').toggle_virt({autogen=true, silent=true})<CR>")
map_key("n", "<Up>", "gk")
map_key("n", "<Down>", "gj")
