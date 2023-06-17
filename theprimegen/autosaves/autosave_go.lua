
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
    group = vim.api.nvim_create_augroup("GoFiles", { clear = true }),
    pattern = "main.go",
    callback = function ()
        local cmd_terminal = new_cmd_client("make run")
        cmd_terminal:toggle()
    end
})


vim.api.nvim_create_autocmd("BufWritePost", {
    group = vim.api.nvim_create_augroup("GoTestFiles", { clear = true }),
    pattern = "*_test.go",
    callback = function ()
        local cmd_terminal = new_cmd_client("make test")
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

