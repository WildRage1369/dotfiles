local autocmd = vim.api.nvim_create_autocmd

vim.wo.wrap = false
vim.wo.breakindent = true
vim.wo.number = true
-- vim.wo.breakindentopt = "shift:2"
vim.wo.linebreak = true
vim.wo.relativenumber = true
vim.opt.conceallevel = 2
vim.opt.concealcursor = "nc"
vim.opt.shiftwidth = 4

-- vim.cmd [[highlight Headline1 guibg=#500e0b gui-bold]]
-- vim.cmd [[highlight Headline2 guibg=#502305]]

-- autocmd("VimResized", {
--     pattern = "*",
--     command = "tabdo wincmd =",
-- })

vim.api.nvim_create_user_command("CompileNeorgPDF", function(input)
    vim.api.nvim_command(":Neorg export to-file ~/Temporary/tmp.md")
    vim.api.nvim_command(
        ": ! pandoc -s -f markdown+lists_without_preceding_blankline -V geometry:margin=1in -V geometry:a4paper -V geometry:nohead=true -V margin-top=0pt -V geometry:textheight=10in ~/Temporary/tmp.md -o "
            .. input.fargs[1]
            .. " -H ~/Documents/prepend.txt --pdf-engine=context"
    )
    vim.api.nvim_command("! firefox " .. input.fargs[1])
end, { nargs = 1, complete = "file" })
