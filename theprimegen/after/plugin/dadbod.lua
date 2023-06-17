vim.g.db_ui_save_location = "~/.config/db_ui"

vim.keymap.set("n", "<leader>Du", vim.cmd.DBUIToggle)
vim.keymap.set("n", "<leader>Df", vim.cmd.DBUIFindBuffer)
vim.keymap.set("n", "<leader>Dr", vim.cmd.DBUIRenameBuffer)
vim.keymap.set("n", "<leader>Dl", vim.cmd.DBUILastQueryInfo)


