local M = {}

-- configuration
local cards = {
    {"Create cards by passing the cards option."},
}

-- runtime vars
local buffer = nil
local win = nil

function set_buffer()
    buffer = vim.api.nvim_create_buf(true, true)
    vim.api.nvim_buf_set_lines(buffer, 1, 1, false, cards[1])
end

function M.show()
    if win ~= nil then return end

    if buffer == nil then
        set_buffer()
    end

    win = vim.api.nvim_open_win(buffer, false, {
        relative = 'editor',
        anchor = 'SE',
        row = vim.go.lines - 2,
        col = vim.go.columns - 2,
        width = 40,
        height = 10,
        border = 'single',
    })
    vim.api.nvim_win_set_option(win, 'number', false)
    vim.api.nvim_win_set_option(win, 'rnu', false)
end

function M.hide()
    if win == nil then return end

    vim.api.nvim_win_hide(win)
end

function M.toggle()
    if win == nil then
        M.show()
    else
        M.hide()
    end
end

function M.setup(opts)
    if opts.cards ~= nil then
        cards = opts.cards
    end
end

return M
