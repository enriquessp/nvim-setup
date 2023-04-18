vim.keymap.set("n", "<leader>lb", vim.cmd.GoBuild)
vim.keymap.set("n", "<leader>lt", vim.cmd.GoTest)
vim.keymap.set("n", "<leader>lc", vim.cmd.GoCoverage)
vim.keymap.set("n", "<leader>ld", vim.cmd.GoDoc)
vim.keymap.set("n", "<leader>lx", vim.cmd.GoRun)

--let g:go_doc_keywordprg_enabled = 0
vim.g.go_doc_keywordprg_enabled = 0
