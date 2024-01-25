require("config")
require("mappings")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

-- local plugins = require("plugins")

require("lazy").setup("plugins", {
    defaults = {
        lazy = true,
    },
})

require("conform").formatters.astyle = {
    prepend_args = { "--style=attach" },
}
require("conform").formatters.stylua = {
    prepend_args = { "--indent-type", "Spaces", "--indent-width", "4" },
}

require("luasnip.loaders.from_vscode").lazy_load()
