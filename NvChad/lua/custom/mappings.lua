local M = {}

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
