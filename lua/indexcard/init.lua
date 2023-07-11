local buffer = vim.api.nvim_create_buf(true, true)
local win = vim.api.nvim_open_win(buffer, false, {
    relative = 'editor',
    anchor = 'SE',
    row = vim.go.lines - 2,
    col = vim.go.columns - 2,
    width = 40,
    height = 10,
    border = 'single',
})
