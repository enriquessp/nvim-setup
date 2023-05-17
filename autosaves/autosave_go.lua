
local bufnr, testCmd = 14, {"make","test"}
local rolloutCmd, modTidyCmd = {"make","rollout-local"},{"go","mod","tidy"}
local printResult = function (_, data)
    if data then
        -- vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, {"From function"})
        vim.api.nvim_buf_set_lines(bufnr, -1, -1, false, data)
    end
end
local cleanBuf = function (data)
    -- if data then
        -- tprint(data)
        -- print(data.file)
    -- end
    vim.api.nvim_buf_set_lines(bufnr, 1, -1, false, {})
end


vim.api.nvim_create_autocmd("BufWritePost", {
    group = vim.api.nvim_create_augroup("GoFiles", { clear = true }),
    pattern = "*.go",
    callback = function (cmdData)
        cleanBuf(cmdData)
        vim.fn.jobstart(rolloutCmd,{
            stdout_buffered = true,
            on_stdout = printResult,
            on_stderr = printResult
        })
    end
})


vim.api.nvim_create_autocmd("BufWritePost", {
    group = vim.api.nvim_create_augroup("GoTestFiles", { clear = true }),
    pattern = "*_test.go",
    callback = function ()
        cleanBuf()
        vim.fn.jobstart(testCmd,{
            stdout_buffered = true,
            on_stdout = printResult,
            on_stderr = printResult
        })
    end
})


vim.api.nvim_create_autocmd("BufWritePost", {
    group = vim.api.nvim_create_augroup("gomod_group", { clear = true }),
    pattern = "go.mod",
    callback = function ()
        cleanBuf()
            vim.fn.jobstart(modTidyCmd,{
                stdout_buffered = true,
                on_stdout = printResult,
                on_stderr = printResult
            })
        end
    })


-- Print contents of `tbl`, with indentation.
-- `indent` sets the initial level of indentation.
function tprint (tbl, indent)
  if not indent then indent = 0 end
  for k, v in pairs(tbl) do
    formatting = string.rep("  ", indent) .. k .. ": "
    if type(v) == "table" then
      print(formatting)
      tprint(v, indent+1)
    elseif type(v) == 'boolean' then
      print(formatting .. tostring(v))
    else
      print(formatting .. v)
    end
  end
end
