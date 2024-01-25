return {
    "nvim-neorg/neorg",
    cmd = "Neorg",
    ft = "norg",
    build = ":Neorg sync-parsers",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        require("neorg").setup({
            load = {
                ["core.defaults"] = {}, -- Loads default behaviour
                ["core.export.markdown"] = {},
                ["core.export"] = {},
                ["core.completion"] = { config = { engine = "nvim-cmp", name = "[Norg]" } },
                ["core.concealer"] = {
                    config = {
                        folds = false,
                        icons = {
                            todo = {
                                urgent = { icon = "" },
                            },
                            list = {
                                icons = { "", "", "", "󱥸", "", "" },
                            },
                        },
                    },
                }, -- Adds pretty icons to your documents
                ["core.esupports.indent"] = {
                    config = {
                        tweaks = {
                            unordered_list1 = 0,
                            unordered_list2 = 3,
                            unordered_list3 = 6,
                            unordered_list4 = 12,
                            unordered_list5 = 15,
                            ordered_list1 = 0,
                            ordered_list2 = 3,
                            ordered_list3 = 6,
                            ordered_list4 = 12,
                            ordered_list5 = 15,
                        },
                    },
                },
                ["core.dirman"] = { -- Manages Neorg workspaces
                    config = {
                        workspaces = {
                            documents = "~/Documents/Neorg",
                            school = "~/School/S24",
                        },
                    },
                },
                ["core.keybinds"] = {
                    config = {
                        hook = function(keybinds)
                            keybinds.remap_key("norg", "n", "<C-Space>", "<Leader>to")
                        end,
                        neorg_leader = "<Leader>",
                    },
                },
                ["core.qol.todo_items"] = {
                    config = {
                        order = {
                            { "undone", " " },
                            { "done", "x" },
                            { "pending", "?" },
                            { "on_hold", "=" },
                            { "cancelled", "_" },
                            { "recurring", "+" },
                            { "important", "!" },
                        },
                    },
                },
            },
        })
    end,
}
