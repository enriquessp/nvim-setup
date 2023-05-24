
local bufnr = vim.api.nvim_create_buf(false, true)
local testCmd, rolloutCmd, modTidyCmd = {"make","test"},{"make","run"},{"go","mod","tidy"}

local printResult = function (_, data)
    if data then
        vim.api.nvim_buf_set_lines(bufnr, -1, -1, false, data)
    end
end

local cleanBuf = function ()
    vim.api.nvim_buf_set_lines(bufnr, 1, -1, false, {})
end

local openWindow = function ()
    local opts = {relative= 'win', width= 100, height= 100, col=100, row= 1, anchor= 'NW', style= 'minimal'}
    vim.api.nvim_open_win(bufnr, 0, opts)
end
openWindow()

vim.api.nvim_create_autocmd("BufWritePost", {
    group = vim.api.nvim_create_augroup("GoFiles", { clear = true }),
    pattern = "main.go",
    callback = function (cmdData)
        cleanBuf()
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



