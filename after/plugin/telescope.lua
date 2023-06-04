-- https://github.com/nvim-telescope/telescope-project.nvim

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>ps', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)
require'telescope'.load_extension('project')

vim.keymap.set('n', '<leader>fp', ":Telescope project<CR>", {})

