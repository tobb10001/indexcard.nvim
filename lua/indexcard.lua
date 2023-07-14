local M = {}

-- configuration
local cards = {
    { "Create cards by passing the cards option." },
}

-- runtime vars
local buffer = nil
local current = 1
local win = nil

-- helpers
local function set_buffer()
    if buffer == nil then
        buffer = vim.api.nvim_create_buf(true, true)
    end
    vim.api.nvim_buf_set_lines(buffer, 0, -1, false, cards[current])
end

-- interface
function M.show()
    if win ~= nil then return end

    if buffer == nil then
        current = 1
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
    win = nil
end

function M.toggle()
    if win == nil then
        M.show()
    else
        M.hide()
    end
end

function M.next()
    if win == nil then return end
    current = current + 1
    if current > #cards then
        current = 1
    end
    set_buffer()
end

function M.prev()
    if win == nil then return end
    current = current - 1
    if current <= 0 then
        current = #cards
    end
    set_buffer()
end

function M.setup(opts)
    if opts.cards ~= nil then
        cards = opts.cards
    end

    vim.api.nvim_create_autocmd("WinClosed", {
        callback = function(ev)
            if tonumber(ev.match) == win then
                win = nil
            end
        end
    })
end

return M
