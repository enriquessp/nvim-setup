local M = {}

vim.opt.nu = true
vim.opt.relativenumber = true

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

local dir=split(os.getenv("PWD"), "/")
local current_dir = dir[#dir]
print("logs_ag.sh " .. current_dir)

M.ag = {
  n = {
    -- MAKEFILE
    ["<leader>md"] = {
     function ()
        require("nvterm.terminal").send("kubectx dev && make rollout-dev", "vertical")
     end,
      "Rollout dev",
    },
    ["<leader>ml"] = {
     function ()
        require("nvterm.terminal").send("kubectx kind-kind && make rollout-local", "vertical")
     end,
      "Rollout local",
    },
    ["<leader>mr"] = {
     function ()
        require("nvterm.terminal").send("make run", "vertical")
     end,
      "Run project locally",
    },
    ["<leader>mx"] = {
     function ()
        require("nvterm.terminal").send("make run-debug", "vertical")
     end,
      "Run deubg",
    },
    -- K8S
    ["<leader>kl"] = {
      function ()
        require("nvterm.terminal").send("logs_ag.sh " .. current_dir, "float")
      end,
      "",
    },
    ["<leader>k9"] = {
      function ()
        require("nvterm.terminal").send("k9s", "float")
      end,
      "",
    },
    ["<leader>kpd"] = {
      function ()
        require("nvterm.terminal").send("kubectx dev && k8s-port-forward-all", "vertical")
      end,
      "",
    },
    ["<leader>kpl"] = {
      function ()
        require("nvterm.terminal").send("kubectx kind-kind && k8s-port-forward-all", "vertical")
      end,
      "",
    },
    ["<leader>kpp"] = {
      function ()
        require("nvterm.terminal").send("kubectx customade && k8s-port-forward-all", "vertical")
      end,
      "",
    },
    ["<leader>kpc"] = {
      function ()
        require("nvterm.terminal").send("kubectx chanteclair && k8s-port-forward-all", "vertical")
      end,
      "",
    },
    -- CYPRESS
    ["<leader>cb"] = {
function ()
        require("nvterm.terminal").send("cd ~/projects/ag/poc-cypressio && make run-booking-spec", "float")
end,
      "",
    },
  },
}

M.telescope_project = {
  n ={
    ["<leader>fp"] = {
      "<cmd> Telescope project<CR>",
      "",
    },
  },
}

local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

M.harpoon = {
  n = {
    ["<C-e>"] = {
      function ()
        ui.toggle_quick_menu()
      end,
      "",
    },
    ["<leader>a"] = {
      function ()
        mark.add_file()
      end,
      "",
    },
    ["<leader>d"] = {
      function ()
        mark.rm_file()
      end,
      "",
   },
    ["<leader>da"] = {
      function ()
        mark.clear_all()
      end,
      "",
    },
    ["<C-h>"] = {
      function ()
        ui.nav_file(1)
      end,
      "",
    },
    ["<C-n>"] = {
      function ()
        ui.nav_file(2)
      end,
      "",
    },
    ["<C-m>"] = {
      function ()
        ui.nav_file(3)
      end,
      "",
    },
  },
}

M.dadbod = {
  n = {
    ["<leader>Du"] = {
      function ()
        vim.cmd.DBUIToggle()
      end,
      "",
    },
    ["<leader>Dl"] = {
      function ()
        vim.cmd.DBUILastQueryInfo()
      end,
      "",
    },
    ["<leader>Dr"] = {
      function ()
        vim.cmd.DBUIRenameBuffer()
      end,
      "",
    },
    ["<leader>Df"] = {
      function ()
        vim.cmd.DBUIFindBuffer()
      end,
      "",
    },
  },
}

M.dap = {
  plugin = true,
  n = {
    ["<leader>db"] = {
      "<cmd> DapToggleBreakpoint <CR>",
      "Add beakpoint at line",
    },
    ["<leader>dus"] = {
      function ()
        local widgets = require("dap.ui.widgets");
        local sidebar = widgets.sidebar(widgets.scopes);
        sidebar.open();
      end,
      "Open debugging sidebar",
    },
  },
}

M.dap_go = {
  plugin = true,
  n = {
    ["<leader>dgt"] = {
      function ()
        require("dap-go").debug_test()
      end,
      "Debug go test",
    },
    ["<leader>dgl"] = {
      function ()
        require("dap-go").debug_last()
      end,
      "Debug last go test",
    },
  },
}

M.gopher = {
  plugin = true,
  n = {
    ["<leader>gsj"] = {
      "<cmd> GoTagAdd json<CR>",
      "Add json struct tags",
    },
    ["<leader>gsy"] = {
      "<cmd> GoTagAdd yaml<CR>",
      "Add yaml struct tags",
    },
    ["<leader>gse"] = {
      "<cmd> GoIfErr<CR>",
      "Add if err block",
    },
  },
}

M.general = {
  v = {
    ["K"] = {
      ":m '<-2<CR>gv=gv",
      "Move block up",
    },
    ["J"] = {
      ":m '>+1<CR>gv=gv",
      "Move block up",
    },
    ["<C-k>"] = {
      "<cmd>cnext<CR>zz",
      "",
    },
    ["<C-j>"] = {
      "<cmd>cprev<CR>zz",
      "",
    },
    ["<leader>k"] = {
      "<cmd>lnext<CR>zz",
      "",
    },
    ["<leader>j"] = {
      "<cmd>lprev<CR>zz",
      "",
    },
  },
}

return M
