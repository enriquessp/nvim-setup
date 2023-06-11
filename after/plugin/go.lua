local Terminal = require("toggleterm.terminal").Terminal

local new_cmd_client = function (cmd)
    return Terminal:new {
        cmd = cmd,
        dir = "./",
        hidden = true,
        direction = "float",
        close_on_exit = false,
        float_opts = {
            border = "curved",
        },
    }
end

vim.api.nvim_create_autocmd("BufWritePost", {
    group = vim.api.nvim_create_augroup("GoTestFiles", { clear = true }),
    pattern = "*_test.go",
    callback = function ()
        local cmd_terminal = new_cmd_client("go test ./...")
        cmd_terminal:toggle()
    end
})


vim.api.nvim_create_autocmd("BufWritePost", {
    group = vim.api.nvim_create_augroup("gomod_group", { clear = true }),
    pattern = "go.mod",
    callback = function ()
        local cmd_terminal = new_cmd_client("go mod tidy")
        cmd_terminal:toggle()
    end
})

vim.keymap.set("n", "<leader>lb", vim.cmd.GoBuild)
vim.keymap.set("n", "<leader>lt", vim.cmd.GoTest)
vim.keymap.set("n", "<leader>lc", vim.cmd.GoCoverageToggle)
vim.keymap.set("n", "<leader>ld", vim.cmd.GoDoc)
vim.keymap.set("n", "<leader>lx", vim.cmd.GoRun)
vim.keymap.set("n", "<leader>lf", vim.cmd.GoDecls)

--let g:go_doc_keywordprg_enabled = 0
vim.g.go_doc_keywordprg_enabled = 0
