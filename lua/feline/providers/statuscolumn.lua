local M = {}

function M.fold_column()
    -- %C - fold column for currently drawn line
    return '%C'
end

function M.line_number()
    -- %l - line number of currently drawn line
    -- %r - relative line number of currently drawn line
    return '%=%{v:relnum?v:relnum:v:lnum}'
end

function M.sign_column()
    -- %s - sign column for currently drawn line
    return '%=%s'
end

return M
