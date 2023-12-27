local api = vim.api

-- Check if Neovim version is 0.9 or greater
if vim.fn.has('nvim-0.9') ~= 1 then
    api.nvim_err_writeln('Feline is only available for Neovim versions 0.9 and above.')
    return
end

local utils = require('feline.utils')
local defaults = require('feline.defaults')
local themes = utils.lazy_require('feline.themes')
local Generator = utils.lazy_require('feline.generator')
local gen, winbar_gen, statuscolumn_gen

local M = {}
M.winbar = {}
M.statuscolumn = {}

-- Clear all highlights created by Feline and remove them from cache
function M.reset_highlights()
    if gen then
        gen:reset_highlights()
    end
    if winbar_gen then
        winbar_gen:reset_highlights()
    end
    if statuscolumn_gen then
        statuscolumn_gen:reset_highlights()
    end
end

-- Add a Feline color theme
function M.add_theme(name, value)
    themes[name] = value
end

function M.winbar.use_theme(name_or_tbl)
    if not winbar_gen then
        return
    end
    utils._use_theme(themes, name_or_tbl, function(colors)
        winbar_gen.config.theme = colors
        M.reset_highlights()
    end)
end

function M.statuscolumn.use_theme(name_or_tbl)
    if not statuscolumn_gen then
        return
    end
    utils._use_theme(themes, name_or_tbl, function(colors)
        statuscolumn_gen.config.theme = colors
        M.reset_highlights()
    end)
end
-- Use a theme (can be either a string containing theme name or a table containing theme colors)
function M.use_theme(name_or_tbl)
    utils._use_theme(themes, name_or_tbl, function(colors)
        M.colors = colors
        M.reset_highlights()
    end)
end

-- Check if component with `name` in the statusline of window `winid` is truncated or hidden
local function is_component_truncated(generator, winid, name)
    if generator.component_truncated[winid][name] == nil then
        api.nvim_err_writeln(string.format("Component with name '%s' not found", name))
        return
    end

    return generator.component_truncated[winid][name]
end

-- Check if component with `name` in the statusline of window `winid` is hidden
local function is_component_hidden(generator, winid, name)
    if generator.component_hidden[winid][name] == nil then
        api.nvim_err_writeln(string.format("Component with name '%s' not found", name))
        return
    end

    return generator.component_hidden[winid][name]
end

function M.is_component_truncated(winid, name)
    return is_component_truncated(gen, winid, name)
end

function M.is_component_hidden(winid, name)
    return is_component_hidden(gen, winid, name)
end

function M.winbar.is_component_truncated(winid, name)
    return is_component_truncated(winbar_gen, winid, name)
end

function M.winbar.is_component_hidden(winid, name)
    return is_component_hidden(winbar_gen, winid, name)
end

local function setup_global_config(config)
    M.separators = config.separators
    M.vi_mode_colors = config.vi_mode_colors
    -- Unload providers in case they were loaded before to prevent custom providers from old
    -- configuration being cached
    package.loaded['feline.providers'] = nil
    M.providers = require('feline.providers')

    -- Register custom providers
    for k, v in pairs(config.custom_providers) do
        M.providers[k] = v
    end

    -- Use configured theme
    M.use_theme(config.theme)

    -- Autocommand to reset highlights according to the `highlight_reset_triggers` configuration
    if next(config.highlight_reset_triggers) then
        utils.create_augroup({
            {
                event = config.highlight_reset_triggers,
                opts = {
                    callback = function()
                        require('feline').reset_highlights()
                    end,
                },
            },
        }, 'feline')
    end
end

local function setup_common(config, is_winbar, is_statuscolumn)
    local module

    if is_winbar then
        M.winbar_module = {}
        module = M.winbar_module
    elseif is_statuscolumn then
        M.statuscolumn_module = {}
        module = M.statuscolumn_module
    else
        M.statusline_module = {}
        module = M.statusline_module
    end

    module.force_inactive = config.force_inactive
    module.disable = config.disable
    module.theme = config.theme

    -- If components table is provided, use it, else use the default
    if config.components then
        module.components = config.components
    else
        local use_icons = pcall(require, 'nvim-web-devicons')

        if is_winbar then
            if use_icons then
                module.components = require('feline.default_components').winbar.icons
            else
                module.components = require('feline.default_components').winbar.noicons
            end
        elseif is_statuscolumn then
            if use_icons then
                module.components = require('feline.default_components').statuscolumn.icons
            else
                module.components = require('feline.default_components').statuscolumn.noicons
            end
        else
            if use_icons then
                module.components = require('feline.default_components').statusline.icons
            else
                module.components = require('feline.default_components').statusline.noicons
            end
        end
    end

    module.conditional_components = config.conditional_components
end

function M.setup(config)
    -- Check if termguicolors is enabled
    if not vim.o.termguicolors and vim.version().minor < 10 then
        api.nvim_err_writeln(
            "Feline needs 'termguicolors' to be enabled to work properly\n"
                .. "Please do `:help 'termguicolors'` in Neovim for more information"
        )
        return
    end

    -- Need to get the winbar configuration before config is parsed
    config = utils.parse_config(config, defaults.statusline)

    setup_global_config(config)
    setup_common(config, false, false)

    -- Create the generator if it doesn't exist, clear the generator if it does
    if not gen then
        gen = Generator.new('statusline', M.statusline_module)
    else
        gen:clear_state()
    end

    -- Ensures custom quickfix statusline isn't loaded
    vim.g.qf_disable_statusline = true
    vim.o.statusline = "%{%v:lua.require'feline'.generate_statusline()%}"
end

function M.winbar.setup(config)
    config = utils.parse_config(config, defaults.winbar)
    setup_common(config, true, false)

    -- Create the generator if it doesn't exist, clear the generator if it does
    if not winbar_gen then
        winbar_gen = Generator.new('winbar', M.winbar_module)
    else
        winbar_gen:clear_state()
    end

    vim.o.winbar = "%{%v:lua.require'feline'.generate_winbar()%}"
end

function M.statuscolumn.setup(config)
    config = utils.parse_config(config, defaults.statuscolumn)
    setup_common(config, false, true)

    -- Create the generator if it doesn't exist
    if not statuscolumn_gen then
        statuscolumn_gen = Generator.new('statuscolumn', M.statuscolumn_module)
    else
        statuscolumn_gen:clear_state()
    end

    vim.o.statuscolumn = "%{%v:lua.require'feline'.generate_statuscolumn()%}"
end

function M.generate_statusline()
    local is_active = api.nvim_get_current_win() == tonumber(vim.g.actual_curwin)
    local maxwidth

    -- If statusline is global, use entire Neovim window width for maxwidth
    -- Otherwise just use width of current window
    if vim.o.laststatus == 3 then
        maxwidth = vim.o.columns
    else
        maxwidth = api.nvim_win_get_width(0)
    end

    return gen:generate(is_active, maxwidth)
end

function M.generate_winbar()
    local is_active = api.nvim_get_current_win() == tonumber(vim.g.actual_curwin)
    local maxwidth = api.nvim_win_get_width(0)

    return winbar_gen:generate(is_active, maxwidth)
end

function M.generate_statuscolumn()
    local is_active = api.nvim_get_current_win() == tonumber(vim.g.actual_curwin)

    return statuscolumn_gen:generate(is_active, nil)
end

return M
