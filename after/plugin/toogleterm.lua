require("toggleterm").setup{}

-- https://github.com/akinsho/toggleterm.nvim
-- https://github.com/bcicen/ctop
-- https://github.com/jesseduffield/lazydocker

function _G.set_terminal_keymaps()
  local opts = {buffer = 0}
  vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
  vim.keymap.set('t', 'jk', [[<C-\><C-n>]], opts)
  vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
  vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
  vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
  vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
  vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], opts)
end

-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')


local M = {}

local Terminal = require("toggleterm.terminal").Terminal

-- Docker
local docker_tui = "lazydocker"

local docker_client = Terminal:new {
  cmd = docker_tui,
  dir = "git_dir",
  hidden = true,
  direction = "float",
  float_opts = {
    border = "double",
  },
}

function M.docker_client_toggle()
  docker_client:toggle()
end

-- Docker ctop
local docker_ctop = "ctop"

local docker_ctop_client = Terminal:new {
  cmd = docker_ctop,
  dir = "git_dir",
  hidden = true,
  direction = "float",
  float_opts = {
    border = "double",
  },
}

function M.docker_ctop_toggle()
  docker_ctop_client:toggle()
end

-- Docker k9s
local docker_k9s = "k9s"

local docker_k9s_client = Terminal:new {
  cmd = docker_k9s,
  dir = "git_dir",
  hidden = true,
  direction = "float",
  float_opts = {
    border = "double",
  },
}

function M.docker_k9s_toggle()
  docker_k9s_client:toggle()
end

vim.keymap.set("n", "<leader>tk", M.docker_k9s_toggle)
vim.keymap.set("n", "<leader>tc", M.docker_ctop_toggle)
vim.keymap.set("n", "<leader>td", M.docker_client_toggle)
vim.keymap.set("n","<leader>th", ":ToggleTerm dir=./ direction=horizontal<CR>")
vim.keymap.set("n","<leader>tv", ":ToggleTerm size=80 dir=./ direction=vertical<CR>")

return M
