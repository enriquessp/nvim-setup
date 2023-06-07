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
            width = 120,
        },
    }
end

vim.keymap.set("n", "<leader>mr", ":!make run<CR>")
vim.keymap.set("n", "<leader>md", ":!make rollout-dev<CR>")
vim.keymap.set("n", "<leader>ml", ":!make rollout-local<CR>")
vim.keymap.set("n", "<leader>mx", function ()
    new_cmd_client("make run-debug"):toggle()
end)



