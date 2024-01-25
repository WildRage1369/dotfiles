return {
    "echasnovski/mini.nvim",
    lazy = false,
    version = false,
    config = function()
        local animate = require("mini.animate")
        require("mini.animate").setup({
            scroll = { enable = false },
            cursor = { timing = animate.gen_timing.cubic({ duration = 150, unit = "total" }) },
        })
        require("mini.comment").setup({
            mappings = {
                comment_line = "<leader>/",
                comment_visual = "<leader>/",
            },
        })
        require("mini.files").setup({
            mappings = {
                close = "<esc>",
                go_in = "<Right>",
                go_out = "<Left>",
            },
        })
        require("mini.move").setup({
            mappings = {
                line_up = "<M-Up>",
                line_down = "<M-Down>",

                up = "<M-Up>",
                down = "<M-Down>",
            },
        })
        require("mini.sessions").setup({
            autoread = true,
        })
        require("mini.pairs").setup({})

        -- Change CWD to where cursor is located -----------------------
        local files_set_cwd = function(path)
            -- Works only if cursor is on the valid file system entry
            local cur_entry_path = MiniFiles.get_fs_entry().path
            local cur_directory = vim.fs.dirname(cur_entry_path)
            vim.fn.chdir(cur_directory)
        end

        vim.api.nvim_create_autocmd("User", {
            pattern = "MiniFilesBufferCreate",
            callback = function(args)
                vim.keymap.set("n", "<leader>d", files_set_cwd, { buffer = args.data.buf_id })
            end,
        })

        -- Toggle hidden files ----------------------------------------
        local show_dotfiles = true
        local filter_show = function(fs_entry)
            return true
        end
        local filter_hide = function(fs_entry)
            return not vim.startswith(fs_entry.name, ".")
        end

        local toggle_dotfiles = function()
            show_dotfiles = not show_dotfiles
            local new_filter = show_dotfiles and filter_show or filter_hide
            MiniFiles.refresh({ content = { filter = new_filter } })
        end

        vim.api.nvim_create_autocmd("User", {
            pattern = "MiniFilesBufferCreate",
            callback = function(args)
                local buf_id = args.data.buf_id
                -- Tweak left-hand side of mapping to your liking
                vim.keymap.set("n", "<leader>.", toggle_dotfiles, { buffer = buf_id })
            end,
        })
        -- end config ---------------------------------
    end,
    keys = {
        { "<space>fm", ":lua MiniFiles.open()<CR>", desc = "Open mini.files file manager" },
    },
}
