local M = {}

local lsp = vim.lsp
local diagnostic = vim.diagnostic

function M.is_lsp_attached()
    if vim.fn.has('nvim-0.10') > 0 then
        return next(lsp.get_clients { bufnr = 0 }) ~= nil
    else
        ---@diagnostic disable-next-line: deprecated
        return next(lsp.get_active_clients { bufnr = 0 }) ~= nil
    end
end

function M.get_diagnostics_count(severity)
  local opts = severity and { severity = severity }
  return (diagnostic.count and severity)
      and diagnostic.count(0, opts)[severity]
      or vim.tbl_count(diagnostic.get(0, opts))
end

function M.diagnostics_exist(severity)
    return M.get_diagnostics_count(severity) > 0
end

function M.lsp_client_names()
    local clients = {}
    if vim.fn.has('nvim-0.10') > 0 then
        for _, client in pairs(lsp.get_clients { bufnr = 0 }) do
            clients[#clients + 1] = client.name
        end
    else
        ---@diagnostic disable-next-line: deprecated
        for _, client in pairs(lsp.get_active_clients { bufnr = 0 }) do
            clients[#clients + 1] = client.name
        end
    end

    return table.concat(clients, ' '), ' '
end

-- Common function used by the diagnostics providers
local function diagnostics(severity)
    local count = M.get_diagnostics_count(severity)

    return count ~= 0 and tostring(count) or ''
end

function M.diagnostic_errors()
    return diagnostics(diagnostic.severity.ERROR), '  '
end

function M.diagnostic_warnings()
    return diagnostics(diagnostic.severity.WARN), '  '
end

function M.diagnostic_info()
    return diagnostics(diagnostic.severity.INFO), '  '
end

function M.diagnostic_hints()
    return diagnostics(diagnostic.severity.HINT), '  '
end

return M
