vim.api.nvim_create_autocmd("BufWritePost", {
  group = vim.api.nvim_create_augroup("gomod_group", { clear = true }),
  pattern = "go.mod",
  callback = function ()
    vim.cmd("GoMod tidy")
  end
})

vim.api.nvim_create_autocmd("BufWritePost", {
  group = vim.api.nvim_create_augroup("gotest_group", { clear = true }),
  pattern = "*_test.go",
  callback = function ()
    require("nvterm.terminal").send("go test ./...", "vertical")
  end
})
