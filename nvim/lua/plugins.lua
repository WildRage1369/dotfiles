return {
    {
        "nvim-treesitter/nvim-treesitter",
        lazy = false,
        opts = {
            ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "norg" },
            auto_install = true,
            highlight = {
                enable = true,
            },
        },
    },
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.5",
        dependencies = { "nvim-lua/plenary.nvim" },
        cmd = "Telescope",
        keys = {
            { "<leader>ff", ":Telescope find_files<CR>", desc = "List files in cwd" },
            { "<leader>fg", ":Telescope live_grep<CR>", desc = "Search for a string in cwd live" },
            { "<leader>fb", ":Telescope buffers<CR>", desc = "List buffers" },
            { "<leader>fs", ":Telescope spell_suggest<CR>", desc = "List spelling suggestions" },
            { "<leader>of", ":Telescope oldfiles<CR>", desc = "List file history" },
        },
        opts = { defaults = { mappings = { i = { ["<esc>"] = "close" } } } },
    },
    {
        "tomiis4/BufferTabs.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" }, -- optional
        lazy = false,
        opts = { padding = 0, display = "column", vertical = "bottom", horizontal = "right" },
        keys = {
            { "<Tab>", ":bnext<CR>", desc = "Go to next buffer" },
            { "<S-Tab>", ":bprev<CR>", desc = "Go to next buffer" },
        },
    },
    {
        "ellisonleao/gruvbox.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            require("gruvbox").setup({
                transparent_mode = true,
                contrast = "hard",
                overrides = {
                    Folded = { bold = true, bg = "none", fg = "#d5c4a1" },
                },
            })
            vim.cmd("colorscheme gruvbox")
        end,
    },
    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        lazy = false,
        opts = {},
    },
    { "nvim-lua/plenary.nvim" },
    { "kkharji/sqlite.lua" },
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
        end,
        opts = {},
    },
    {
        "dundalek/lazy-lsp.nvim",
        lazy = false,
        requires = { "neovim/nvim-lspconfig" },
    },
    {
        "AgusDOLARD/backout.nvim",
        opts = {},
        keys = {
            { "<M-Left>", "<cmd>lua require('backout').back()<cr>", mode = { "i" } },
            { "<M-Right>", "<cmd>lua require('backout').out()<cr>", mode = { "i" } },
            { "<M-Left>", "<cmd>lua require('backout').back()<cr>", mode = { "n" } },
            { "<M-Right>", "<cmd>lua require('backout').out()<cr>", mode = { "n" } },
        },
    },
    {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
    },
    {
        "AckslD/nvim-neoclip.lua",
        requires = { { "kkharji/sqlite.lua", module = "sqlite" }, { "nvim-telescope/telescope.nvim" } },
        opts = { enable_persistent_history = true, continuous_sync = true },
        keys = { { "<Leader>c", ":Tele neoclip<CR>", desc = "Open clipboard history" } },
    },

    {
        "tzachar/cmp-tabnine",
        build = "./install.sh",
        dependencies = "hrsh7th/nvim-cmp",
    },
    {
        "L3MON4D3/LuaSnip",
        version = "v2.*",
        build = "make install_jsregexp",
        dependencies = { "rafamadriz/friendly-snippets" },
    },
    {
        "stevearc/dressing.nvim",
        opts = {},
    },
    {
        "otavioschwanck/arrow.nvim",
        opts = {
            show_icons = true,
            leader_key = ";", -- Recommended to be a single key
            save_key = function()
                return "global"
            end,
        },
        keys = { { ";", ";" } },
    },
    {
        "jbyuki/nabla.nvim",
    },
    {
        "anuvyklack/pretty-fold.nvim",
        lazy = false,
        opts = {
            fill_char = " ",
            keep_indent = false,
            sections = {
                left = {
                    "",
                    "content",
                    " ",
                    "number_of_folded_lines",
                },
                right = {
                    "percentage",
                    "  ",
                },
            },
            ft_ignore = {},
        },
    },
}
