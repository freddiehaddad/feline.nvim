local api = vim.api

local M = {}

local scroll_bar_blocks = { '▁', '▂', '▃', '▄', '▅', '▆', '▇', '█' }

function M.position(_, opts)
    local line, col = unpack(api.nvim_win_get_cursor(0))

    local line_text = api.nvim_get_current_line()
    -- Get the text before the cursor in the current line
    local before_cursor = line_text:sub(1, col)

    -- Replace tabs with the equivalent amount of spaces according to the value of 'tabstop'
    before_cursor = before_cursor:gsub('\t', string.rep(' ', vim.bo.tabstop))

    -- Turn col from byteindex to column number and make it start from 1
    col = vim.str_utfindex(before_cursor) + 1

    local linenr_min_width, colnr_min_width

    if opts.padding then
        if type(opts.padding) == 'table' then
            linenr_min_width = opts.padding.line or 3
            colnr_min_width = opts.padding.col or 2
        else
            linenr_min_width = 3
            colnr_min_width = 2
        end
    else
        linenr_min_width = 0
        colnr_min_width = 0
    end

    -- Get padded line and column string
    local line_str = string.rep(' ', linenr_min_width - math.floor(math.log10(line)) - 1)
        .. tostring(line)

    local col_str = string.rep(' ', colnr_min_width - math.floor(math.log10(col)) - 1)
        .. tostring(col)

    if opts.format then
        local str = opts.format
        str = str:gsub('{line}', line_str)
        str = str:gsub('{col}', col_str)
        return str
    else
        return string.format('%s:%s', line_str, col_str)
    end
end

function M.line_percentage(_, opts)
    local curr_line = api.nvim_win_get_cursor(0)[1]
    local lines = api.nvim_buf_line_count(0)

    if lines == 1 then
        return 'All'
    elseif curr_line == 1 then
        return 'Top'
    elseif curr_line == lines then
        return 'Bot'
    else
        local format = opts.padding and '%2d%%%%' or '%d%%%%'
        return string.format(format, math.ceil(curr_line / lines * 99))
    end
end

function M.scroll_bar(_, opts)
    local curr_line = api.nvim_win_get_cursor(0)[1]
    local lines = api.nvim_buf_line_count(0)

    if opts.reverse then
        return string.rep(scroll_bar_blocks[8 - math.floor(curr_line / lines * 7)], 2)
    else
        return string.rep(scroll_bar_blocks[math.floor(curr_line / lines * 7) + 1], 2)
    end
end

function M.search_count()
    if vim.v.hlsearch == 0 then
        return ''
    end

    local ok, result = pcall(vim.fn.searchcount, { maxcount = 999, timeout = 250 })
    if not ok or next(result) == nil or result.incomplete == 1 then
        return ''
    end

    local denominator = math.min(result.total, result.maxcount)
    return string.format('[%d/%d]', result.current, denominator)
end

function M.macro()
    local recording_register = vim.fn.reg_recording()
    if recording_register == '' then
        return ''
    else
        return 'Recording @' .. recording_register
    end
end

return M
