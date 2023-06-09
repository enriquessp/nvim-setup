local M = {}

M.terminal = {
  n = {
    ["<leader>th"] = {
      function ()
        require("nvterm.terminal").new "horizontal"
      end,
      "",
    },
    ["<leader>tv"] = {
      function ()
        require("nvterm.terminal").new "vertical"
      end,
      "",
    },
  }
}

M.fugitive = {
  plugin = true,
  n = {
    ["<leader>Gs"] = {  vim.cmd.Git  },
    ["<leader>Gl"] = {  ":Git log<CR>"  },
    ["<leader>Gd"] = {  vim.cmd.Gdiffsplit  },
    ["<leader>Gc"] = {  ":Git commit<CR>" },
    ["<leader>Gp"] = {  ":Git pull<CR>" },
    ["<leader>GP"] = {  ":Git push<CR>" },
    ["<leader>Ga"] = {  function ()
      -- ":Git add ".. vim.fn.expand('%') .."<CR>"
      vim.cmd.Git(" add " .. vim.fn.expand('%'))
    end
    },
  },
}

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
        local cmd = "stern -l app=" .. current_dir .. " -o raw | grep -e '^{' | jq"
        require("nvterm.terminal").send(cmd, "float")
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
        local cmd = "kubectx dev && k8s-port-forward-all " .. current_dir
        require("nvterm.terminal").send(cmd, "vertical")
      end,
      "",
    },
    ["<leader>kpl"] = {
      function ()
        local cmd = "kubectx kind-kind && k8s-port-forward-all " .. current_dir
        require("nvterm.terminal").send(cmd, "vertical")
      end,
      "",
    },
    ["<leader>kpp"] = {
      function ()
        local cmd = "kubectx customade && k8s-port-forward-all " .. current_dir
        require("nvterm.terminal").send(cmd, "vertical")
      end,
      "",
    },
    ["<leader>kpc"] = {
      function ()
        local cmd = "kubectx chanteclair && k8s-port-forward-all " .. current_dir
        require("nvterm.terminal").send(cmd, "vertical")
      end,
      "",
    },
    -- CYPRESS
    ["<leader>cb"] = {
      function ()
        local cmd = "cd ~/projects/ag/poc-cypressio && make run-booking-spec"
        require("nvterm.terminal").send(cmd, "horizontal")
      end,
      "",
    },
    ["<leader>ct"] = {
      function ()
        local cmd = "cd ~/projects/ag/poc-cypressio && make run-ticketing-spec"
        require("nvterm.terminal").send(cmd, "horizontal")
      end,
      "",
    },
    ["<leader>co"] = {
      function ()
        local cmd = "cd ~/projects/ag/poc-cypressio && make open"
        require("nvterm.terminal").send(cmd, "horizontal")
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
    ["<C-m>"] = {
      function ()
        ui.nav_file(2)
      end,
      "",
    },
    ["<C-b>"] = {
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
    ["<C-n>"] = {
      function ()
        vim.cmd("DapStepOver")
      end,
      "Dap step over",
    },
    ["<C-m>"] = {
      function ()
        vim.cmd("DapStepInto")
      end,
      "Dap step into",
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

M.lspconfig = {
  plugin = true,
  n = {
    ["<leader>rn"] = {
      vim.lsp.buf.rename,
      "",
    },
  }
}

M.general = {
  v = {
    ["K"] = {
      ":m '<-2<CR>gv=gv",
      "Move block up",
    },
    ["J"] = {
      ":m '>+1<CR>gv=gv",
      "Move block down",
    },
    ["<C-d>"] = {
      "<C-d>zz",
      "",
    },
    ["<C-u>"] = {
      "<C-d>zz",
      "",
    },
    ["<leader>k"] = {
      ":lnext<CR>zz",
      "",
    },
    ["<leader>j"] = {
      ":lprev<CR>zz",
      "",
    },
  },
}

M.trouble = {
  n = {
    ["gr"] = {
      "<cmd>TroubleToggle lsp_references<CR>",
      "",
      opts = {
        silent = true,
        noremap = true,
      },
    },
    ["gi"] = {
      "<cmd>TroubleToggle lsp_implementations<CR>",
      "",
      opts = {
        silent = true,
        noremap = true,
      },
    },
  }
}

M.vimgo = {
  n = {
    ["<leader>lf"] = {
      ":GoDecls<CR>",
    },
    ["<leader>lb"] = {
      ":GoBuild<CR>",
    },
    ["<leader>lt"] = {
      ":GoTest<CR>",
    },
    ["<leader>lc"] = {
      ":GoCoverageToggle<CR>",
    },
  }
}

M.zenmode = {
  n = {
    ["<leader>zz"] = {
      function()
        require("zen-mode").setup {
          window = {
            width = 100,
            options = { }
          },
        }
        require("zen-mode").toggle()
      end
    },
  }
}

return M
