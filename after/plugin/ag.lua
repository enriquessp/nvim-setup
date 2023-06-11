local Terminal = require("toggleterm.terminal").Terminal

local new_cmd_client = function (cmd, dir, direction)
    return Terminal:new {
        cmd = cmd,
        dir = dir,
        hidden = true,
        direction = direction,
        close_on_exit = false,
        float_opts = {
            border = "curved",
            width = 120,
        },
    }
end

vim.keymap.set("n", "<leader>md", ":!kubectx dev && make rollout-dev<CR>")
vim.keymap.set("n", "<leader>ml", ":!kubectx local && make rollout-local<CR>")

vim.keymap.set("n", "<leader>mr", ":!make run<CR>")
vim.keymap.set("n", "<leader>mx", function ()
    new_cmd_client("make run-debug", "./", "vertical"):toggle()
end)


vim.keymap.set("n", "<leader>cb", function ()
    new_cmd_client("make run-booking-spec", "~/projects/ag/poc-cypressio", "horizontal"):toggle()
end);
vim.keymap.set("n", "<leader>ct", function ()
    new_cmd_client("make run-ticketing-spec", "~/projects/ag/poc-cypressio", "horizontal"):toggle()
end);
vim.keymap.set("n", "<leader>ci", function ()
    new_cmd_client("make run-import-booking-spec", "~/projects/ag/poc-cypressio", "horizontal"):toggle()
end);

