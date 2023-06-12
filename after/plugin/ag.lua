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
        },
    }
end

function split(pString, pPattern)
   local Table = {}  -- NOTE: use {n = 0} in Lua-5.0
   local fpat = "(.-)" .. pPattern
   local last_end = 1
   local s, e, cap = pString:find(fpat, 1)
   while s do
      if s ~= 1 or cap ~= "" then
     table.insert(Table,cap)
      end
      last_end = e+1
      s, e, cap = pString:find(fpat, last_end)
   end
   if last_end <= #pString then
      cap = pString:sub(last_end)
      table.insert(Table, cap)
   end
   return Table
end

-- MAKEFILE
vim.keymap.set("n", "<leader>md", ":!kubectx dev && make rollout-dev<CR>")
vim.keymap.set("n", "<leader>ml", ":!kubectx kind-kind && make rollout-local<CR>")

vim.keymap.set("n", "<leader>mr", ":!make run<CR>")
vim.keymap.set("n", "<leader>mx", function ()
    new_cmd_client("make run-debug", "./", "vertical"):toggle()
end)

-- K8S
vim.keymap.set("n", "<leader>kl", function ()
    local dir=split(os.getenv("PWD"), "/")
    local current_dir = dir[#dir]
    new_cmd_client("logs_ag.sh " .. current_dir, "./", "float"):toggle()
end)
vim.keymap.set("n", "<leader>kr", function ()
    local dir=split(os.getenv("PWD"), "/")
    local current_dir = dir[#dir]
    new_cmd_client("kubectl rollout restart deploy " .. current_dir, "./", "float"):toggle()
end)
vim.keymap.set("n", "<leader>k9", function ()
    new_cmd_client("k9s", "./", "float"):toggle()
end)

-- CYPRESS
vim.keymap.set("n", "<leader>cb", function ()
    new_cmd_client("make run-booking-spec", "~/projects/ag/poc-cypressio", "horizontal"):toggle()
end);
vim.keymap.set("n", "<leader>ct", function ()
    new_cmd_client("make run-ticketing-spec", "~/projects/ag/poc-cypressio", "horizontal"):toggle()
end);
vim.keymap.set("n", "<leader>ci", function ()
    new_cmd_client("make run-import-booking-spec", "~/projects/ag/poc-cypressio", "horizontal"):toggle()
end);
