require("custom.configs.general")

local plugins = {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "gopls",
        "jdtls",
        "marksman",
      },
    },
  },
  {
    "folke/trouble.nvim",
    lazy = false,
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("custom.configs.trouble")
      require("core.utils").load_mappings("trouble")
    end
  },
  {
    "mfussenegger/nvim-dap",
    init = function ()
      require("core.utils").load_mappings("dap")
    end
  },
  {
    "leoluz/nvim-dap-go",
    ft = "go",
    dependencies = "mfussenegger/nvim-dap",
    config = function (_, opts)
      require("dap-go").setup(opts)
      require("core.utils").load_mappings("dap_go")
    end
  },
  -- {"dreamsofcode-io/nvim-dap-go"},
  {
    "neovim/nvim-lspconfig",
    config = function ()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    ft = "go",
    opts = function ()
      return require "custom.configs.null-ls"
    end
  },
  {
    "olexsmir/gopher.nvim",
    ft = "go",
    init = function ()
      require "custom.inits.gopher"
    end,
    config = function(_, opts)
      require("gopher").setup(opts)
      require("core.utils").load_mappings("gopher")
    end,
    build = function()
      vim.cmd [[silent! GoInstallDeps]]
    end,
  },
  {
    "theprimeagen/harpoon",
    config = function (_,opts)
      require("harpoon").setup(opts)
      require("core.utils").load_mappings("harpoon")
    end
  },
  {
    "kristijanhusak/vim-dadbod-ui",
    dependencies = "tpope/vim-dadbod",
    config = function ()
      require "custom.configs.dadbod"
    end
  },
  {
    "nvim-telescope/telescope-project.nvim",
    dependencies = "nvim-telescope/telescope.nvim",
    init = function ()
      vim.defer_fn(function()
        require'telescope'.load_extension('project')
      end, 0)
    end,
  },
  {
    "tpope/vim-fugitive",
    lazy = false,
    config = function ()
      require("core.utils").load_mappings("fugitive")
    end,
  },
  {
    "mfussenegger/nvim-jdtls",
    ft = "*.java",
    init = function ()
      vim.defer_fn(function ()
       require"custom.inits.jdtls"
      end, 0)
    end
  },
  {
    "junegunn/fzf",
    lazy = false,
  },
  {
    "fatih/vim-go",
    lazy = false,
    depedencies = "junegunn/fzf.vim",
    build = function ()
      vim.cmd("GoUpdateBinaries")
    end
  },
  {
    "iamcco/markdown-preview.nvim",
    build = function() vim.fn["mkdp#util#install"]() end,
  },
  {
    "iamcco/markdown-preview.nvim",
    build = "cd app && npm install",
    setup = function() vim.g.mkdp_filetypes = { "markdown" } end,
    ft = { "markdown" },
  },
}
return plugins
