--vim.keymap.set("n", "<leader>ds", vim.cmd.GoDebugStart)
--vim.keymap.set("n", "<leader>dc", vim.cmd.GoDebugContinue)
--vim.keymap.set("n", "<leader>dn", vim.cmd.GoDebugNext)
--vim.keymap.set("n", "<leader>dr", vim.cmd.GoDebugRestart)
--vim.keymap.set("n", "<leader>dt", vim.cmd.GoDebugStop)

vim.keymap.set("n", "<F5>", ":lua require'dap'.continue()<CR>")
vim.keymap.set("n", "<F10>", ":lua require'dap'.step_over()<CR>")
vim.keymap.set("n", "<F11>", ":lua require'dap'.step_into()<CR>")
vim.keymap.set("n", "<F12>", ":lua require'dap'.step_out()<CR>")
vim.keymap.set("n", "<leader>b", ":lua require'dap'.toggle_breakpoint()<CR>")
vim.keymap.set("n", "<leader>B", ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>")
vim.keymap.set("n", "<leader>lp", ":lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>")
vim.keymap.set("n", "<leader>dr", ":lua require'dap'.repl.open()<CR>")

require("dap-go").setup({
    on_attach = function ()
    end
})

require("dapui").setup({
    mappings = {
        expand = "<CR>",
        open = "o",
        remove = "d"
    },
    sidebar = {
        elements = {
            "scopes",
            "scopes",
            "watches",
        },
        width = 40,
        position = "left"
    }
})

