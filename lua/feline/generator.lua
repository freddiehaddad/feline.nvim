local bo = vim.bo
local api = vim.api

local feline = require('feline')
local utils = require('feline.utils')

-- Evaluate a component key if it is a function, else return the value
-- If the key is a function, every argument after the first one is passed to it
local function evaluate_if_function(key, ...)
    if type(key) == 'function' then
        return key(...)
    else
        return key
    end
end

-- Return true if any pattern in tbl matches provided value
local function find_pattern_match(tbl, val)
    return tbl
        and next(vim.tbl_filter(function(pattern)
            return val:match(pattern)
        end, tbl))
end

-- If highlight is a string, use it as highlight name and
-- extract the properties from the highlight
local function get_hl_properties(hlname)
    local hl = api.nvim_get_hl_by_name(hlname, true)
    local styles = {}

    for k, v in ipairs(hl) do
        if v == true then
            styles[#styles + 1] = k
        end
    end

    return {
        name = hlname,
        fg = hl.foreground and string.format('#%06x', hl.foreground),
        bg = hl.background and string.format('#%06x', hl.background),
        style = next(styles) and table.concat(styles, ',') or 'NONE',
    }
end

-- Generator class
local Generator = {}
-- List of generators
Generator.list = {}

Generator.__index = function(tbl, key)
    if Generator[key] then
        return Generator[key]
    elseif type(key) == 'number' and tbl == Generator then
        -- Allow accessing generators using the generator index
        return Generator.list[key]
    end
end
Generator.__newindex = function(_, _, _) end
Generator.__metatable = false

function Generator.new(name, config)
    local index = #Generator.list + 1

    local gen = setmetatable({
        -- Generator index
        index = index,
        -- Cached highlights
        highlights = {},
        -- Used to check if a certain component is truncated
        component_truncated = {},
        -- Used to check if a certain component is hidden
        component_hidden = {},
        -- Cached provider strings for providers that are updated through a trigger
        provider_cache = { short = {}, long = {} },
        -- Flags to check if the autocmd for a provider update trigger has been created
        provider_autocmd = {},
        -- Generator name
        name = name,
        -- Configuration options
        config = config,
        -- Most recently used components table, used to check if components table changed
        last_used_components = {},
    }, Generator)

    Generator.list[index] = gen
    return gen
end

-- Add highlight and store its name in the generator highlights table
local function add_hl(gen, name, fg, bg, style)
    api.nvim_command(string.format('highlight %s gui=%s guifg=%s guibg=%s', name, style, fg, bg))

    gen.highlights[name] = true
end

-- Check if current buffer is forced to have inactive statusline
local function is_forced_inactive(gen)
    local buftype = bo.buftype
    local filetype = bo.filetype
    local bufname = api.nvim_buf_get_name(0)

    return find_pattern_match(gen.config.force_inactive.filetypes, filetype)
        or find_pattern_match(gen.config.force_inactive.buftypes, buftype)
        or find_pattern_match(gen.config.force_inactive.bufnames, bufname)
end

-- Check if buffer is configured to have statusline disabled
local function is_disabled(gen)
    local buftype = bo.buftype
    local filetype = bo.filetype
    local bufname = api.nvim_buf_get_name(0)

    return find_pattern_match(gen.config.disable.filetypes, filetype)
        or find_pattern_match(gen.config.disable.buftypes, buftype)
        or find_pattern_match(gen.config.disable.bufnames, bufname)
end

-- Parse highlight table, inherit default/parent values if values are not given
local function parse_hl(hl, parent_hl)
    parent_hl = parent_hl or {}

    local fg = hl.fg or parent_hl.fg or feline.colors.fg
    local bg = hl.bg or parent_hl.bg or feline.colors.bg
    local style = hl.style or parent_hl.style or 'NONE'

    if feline.colors[fg] then
        fg = feline.colors[fg]
    end
    if feline.colors[bg] then
        bg = feline.colors[bg]
    end

    return {
        fg = fg,
        bg = bg,
        style = style,
    }
end

-- Generate unique name for highlight if name is not given
-- Create the highlight with the name if it doesn't exist
-- If given a string, just interpret it as an external highlight group and return it
local function get_hlname(gen, hl, parent_hl)
    if type(hl) == 'string' then
        return hl
    end

    -- If highlight name exists and is cached, just return it
    if hl.name and gen.highlights[hl.name] then
        return hl.name
    end

    hl = parse_hl(hl, parent_hl)

    local fg_str, bg_str

    -- If first character of the color starts with '#', remove the '#' and keep the rest
    -- If it doesn't start with '#', do nothing
    if hl.fg:sub(1, 1) == '#' then
        fg_str = hl.fg:sub(2)
    else
        fg_str = hl.fg
    end
    if hl.bg:sub(1, 1) == '#' then
        bg_str = hl.bg:sub(2)
    else
        bg_str = hl.bg
    end

    -- Generate unique hl name from color strings if a name isn't provided
    local hlname = hl.name
        or string.format(
            'StatusComponent_%s_%s_%s',
            fg_str,
            bg_str,
            string.gsub(hl.style, ',', '_')
        )

    if not gen.highlights[hlname] then
        add_hl(gen, hlname, hl.fg, hl.bg, hl.style)
    end

    return hlname
end

-- Parse component separator to return parsed string
-- By default, foreground color of separator is background color of parent
-- and background color is set to default background color
local function parse_sep(gen, sep, parent_bg, is_component_empty)
    if sep == nil then
        return ''
    end

    sep = evaluate_if_function(sep)

    local hl
    local str

    if type(sep) == 'string' then
        if is_component_empty then
            return ''
        end

        str = sep
        hl = { fg = parent_bg, bg = feline.colors.bg }
    else
        if is_component_empty and not sep.always_visible then
            return ''
        end

        str = evaluate_if_function(sep.str) or ''
        hl = evaluate_if_function(sep.hl) or { fg = parent_bg, bg = feline.colors.bg }
    end

    if feline.separators[str] then
        str = feline.separators[str]
    end

    return string.format('%%#%s#%s', get_hlname(gen, hl), str)
end

-- Either parse a single separator or a list of separators returning the parsed string
local function parse_sep_list(gen, sep_list, parent_bg, is_component_empty)
    if sep_list == nil then
        return ''
    end

    if
        type(sep_list) == 'table'
        and sep_list[1]
        and (
            type(sep_list[1]) == 'function'
            or type(sep_list[1]) == 'table'
            or type(sep_list[1]) == 'string'
        )
    then
        local sep_strs = {}

        for _, v in ipairs(sep_list) do
            sep_strs[#sep_strs + 1] = parse_sep(gen, v, parent_bg, is_component_empty)
        end

        return table.concat(sep_strs)
    else
        return parse_sep(gen, sep_list, parent_bg, is_component_empty)
    end
end

-- Parse component icon and return parsed string
-- By default, icon inherits component highlights
local function parse_icon(gen, icon, parent_hl, is_component_empty)
    if icon == nil then
        return ''
    end

    icon = evaluate_if_function(icon)

    local hl
    local str

    if type(icon) == 'string' then
        if is_component_empty then
            return ''
        end

        str = icon
        hl = parent_hl
    else
        if is_component_empty and not icon.always_visible then
            return ''
        end

        str = evaluate_if_function(icon.str) or ''
        hl = evaluate_if_function(icon.hl) or parent_hl
    end

    return string.format('%%#%s#%s', get_hlname(gen, hl, parent_hl), str)
end

-- Parse component provider to return the provider string and default icon
local function parse_provider(gen, provider, component, is_short, winid, section_nr, component_nr)
    local str = ''
    local icon

    -- If provider is a string and its name matches the name of a registered provider, use it
    if type(provider) == 'string' then
        if feline.providers[provider] then
            str, icon = feline.providers[provider](component, {})
        else
            str = provider
        end

        return str, icon
    end

    -- If provider is a function, just evaluate it normally
    if type(provider) == 'function' then
        str, icon = provider(component)
    -- If provider is a table, get the provider name and opts and evaluate the provider
    elseif type(provider) == 'table' then
        local provider_fn, provider_opts

        if not provider.name then
            api.nvim_err_writeln("Provider table doesn't have the provider name")
        elseif type(provider.name) ~= 'string' then
            api.nvim_err_writeln(
                string.format(
                    "Expected 'string' for provider name, got '%s' instead",
                    type(provider.name)
                )
            )
        elseif not feline.providers[provider.name] then
            api.nvim_err_writeln(
                string.format("Provider with name '%s' doesn't exist", provider.name)
            )
        else
            provider_fn = feline.providers[provider.name]
            provider_opts = provider.opts or {}
        end

        local update = evaluate_if_function(provider.update)

        if update == nil then
            str, icon = provider_fn(component, provider_opts)
        else
            local provider_cache_tbl

            if is_short then
                provider_cache_tbl = gen.provider_cache.short
            else
                provider_cache_tbl = gen.provider_cache.long
            end

            -- Initialize provider cache tables
            if not gen.provider_cache.long[winid] then
                gen.provider_cache.long[winid] = {}
            end

            if not gen.provider_cache.long[winid][section_nr] then
                gen.provider_cache.long[winid][section_nr] = {}
            end

            if not gen.provider_cache.short[winid] then
                gen.provider_cache.short[winid] = {}
            end

            if not gen.provider_cache.short[winid][section_nr] then
                gen.provider_cache.short[winid][section_nr] = {}
            end

            -- If `update` is true or provider string is not cached, call the provider function
            -- and cache it
            -- Use == true for comparison to prevent the condition being true if `update` is a table
            if update == true or not provider_cache_tbl[winid][section_nr][component_nr] then
                local cache_str, cache_icon = provider_fn(component, provider_opts)

                provider_cache_tbl[winid][section_nr][component_nr] = {
                    str = cache_str,
                    icon = cache_icon,
                }
            end

            -- If `update` is a table, it means that the provider update is triggered through
            -- autocmds
            if type(update) == 'table' then
                -- Initialize autocmd table structure
                if not gen.provider_autocmd[winid] then
                    gen.provider_autocmd[winid] = {}
                end

                if not gen.provider_autocmd[winid][section_nr] then
                    gen.provider_autocmd[winid][section_nr] = {}
                end

                -- If an autocmd hasn't been created for the provider update trigger, create it
                if not gen.provider_autocmd[winid][section_nr][component_nr] then
                    gen.provider_autocmd[winid][section_nr][component_nr] = true

                    utils.create_augroup({
                        {
                            event = update,
                            opts = {
                                callback = function()
                                    gen:trigger_provider_update(winid, section_nr, component_nr)
                                end,
                            },
                        },
                    }, 'felineProviders' .. gen.name, true)
                end
            end

            str = provider_cache_tbl[winid][section_nr][component_nr].str
            icon = provider_cache_tbl[winid][section_nr][component_nr].icon
        end
    end

    if type(str) ~= 'string' then
        api.nvim_err_writeln(
            string.format("Provider must evaluate to string, got type '%s' instead", type(provider))
        )

        str = ''
    end

    return str, icon
end

local function parse_component(gen, component, use_short_provider, winid, section_nr, component_nr)
    local enabled

    if component.enabled ~= nil then
        enabled = evaluate_if_function(component.enabled)
    else
        enabled = true
    end

    if not enabled then
        return ''
    end

    local hl = evaluate_if_function(component.hl) or {}
    local hlname

    if type(hl) == 'string' then
        -- If highlight is a string, then accept it as an external highlight group and
        -- extract its properties for use as a parent highlight for separators and icon
        hlname = hl
        hl = get_hl_properties(hl)
    else
        -- If highlight is a table, parse the highlight so it can be passed to
        -- parse_sep_list and parse_icon
        hl = parse_hl(hl)
    end

    local provider, str, icon

    if use_short_provider then
        provider = component.short_provider
    else
        provider = component.provider
    end

    if provider then
        str, icon = parse_provider(
            gen,
            provider,
            component,
            use_short_provider,
            winid,
            section_nr,
            component_nr
        )
    else
        str = ''
    end

    local is_component_empty = str == ''

    local left_sep_str = parse_sep_list(gen, component.left_sep, hl.bg, is_component_empty)

    local right_sep_str = parse_sep_list(gen, component.right_sep, hl.bg, is_component_empty)

    icon = parse_icon(gen, component.icon or icon, hl, is_component_empty)

    return string.format(
        '%s%s%%#%s#%s%s',
        left_sep_str,
        icon,
        hlname or get_hlname(gen, hl),
        str,
        right_sep_str
    )
end

-- Wrapper around parse_component that handles any errors that happen while parsing the components
-- and points to the location of the component in case of any errors
local function parse_component_handle_errors(
    gen,
    component,
    use_short_provider,
    winid,
    section_nr,
    component_nr,
    focus_type
)
    local ok, result =
        pcall(parse_component, gen, component, use_short_provider, winid, section_nr, component_nr)

    if not ok then
        api.nvim_err_writeln(
            string.format(
                'Feline: error while processing %s component number %d on section %d of type '
                    .. "'%s' for window %d: %s",
                gen.name,
                component_nr,
                section_nr,
                focus_type,
                winid,
                result
            )
        )

        return ''
    end

    return result
end

local function get_component_width(component_str)
    if not api.nvim_eval_statusline then
        return 0
    end

    return api.nvim_eval_statusline(component_str, { maxwidth = 0 }).width
end

function Generator:trigger_provider_update(winid, section_nr, component_nr)
    self.provider_cache.long[winid][section_nr][component_nr] = nil
    self.provider_cache.short[winid][section_nr][component_nr] = nil
end

-- Generate statusline string from components table
function Generator:generate(is_active, maxwidth)
    local components
    local winid = api.nvim_get_current_win()

    self.component_truncated[winid] = {}
    self.component_hidden[winid] = {}

    if is_disabled(self) then
        return ''
    end

    -- If a condition for one of the conditional components is satisfied, use those components
    if self.config.conditional_components then
        for _, v in ipairs(self.config.conditional_components) do
            if v.condition() then
                components = v
                break
            end
        end
    end

    -- If components table changed, clear generator state without resetting highlights
    if not self.last_used_components[winid] then
        self.last_used_components[winid] = components
    elseif self.last_used_components[winid] ~= components then
        self:clear_state(false)
        self.last_used_components[winid] = components
    end

    -- If none of the conditional components match, use the default components
    if not components then
        if self.config.components then
            components = self.config.components
        else
            return ''
        end
    end

    local statusline_type

    if is_active and not is_forced_inactive(self) then
        statusline_type = 'active'
    else
        statusline_type = 'inactive'
    end

    local sections = components[statusline_type]

    if not sections then
        return ''
    end

    -- Iterate through all the components, parse them and store the component strings, each
    -- component's indices and width in separate tables, while also calculating the statusline width
    local component_strs = {}
    local component_indices = {}
    local component_widths = {}
    local statusline_width = 0

    for i, section in ipairs(sections) do
        component_strs[i] = {}
        component_widths[i] = {}

        for j, component in ipairs(section) do
            if component.name then
                if self.component_truncated[winid][component.name] ~= nil then
                    api.nvim_err_writeln(
                        string.format(
                            'Feline: error while parsing components for window %d: '
                                .. "Multiple components with name '%s'",
                            winid,
                            component.name
                        )
                    )
                    return ''
                end
                self.component_truncated[winid][component.name] = false
                self.component_hidden[winid][component.name] = false
            end

            local component_str =
                parse_component_handle_errors(self, component, false, winid, i, j, statusline_type)

            local component_width = get_component_width(component_str)

            component_strs[i][j] = component_str
            component_widths[i][j] = component_width
            statusline_width = statusline_width + component_width

            component_indices[#component_indices + 1] = { i, j }
        end
    end

    -- If statusline width is greater than maxwidth, begin the truncation process
    if maxwidth and statusline_width > maxwidth then
        -- First, sort the component indices in ascending order of the priority of the components
        -- that the indices refer to
        table.sort(component_indices, function(first, second)
            local first_priority = sections[first[1]][first[2]].priority or 0
            local second_priority = sections[second[1]][second[2]].priority or 0

            return first_priority < second_priority
        end)

        -- Then, iterate through the sorted indices to access the components in order of priority,
        -- and if the component has a short_provider, use it instead of the normal provider to
        -- truncate the component
        for _, indices in ipairs(component_indices) do
            local section, number = indices[1], indices[2]
            local component = sections[section][number]

            if component.short_provider then
                local component_str = parse_component_handle_errors(
                    self,
                    component,
                    true,
                    winid,
                    section,
                    number,
                    statusline_type
                )

                local component_width = get_component_width(component_str)

                -- Calculate how much the width of the statusline decreases if the provider is
                -- replaced with the short_provider, and if it's greater than 0 (which implies that
                -- the statusline decreased in width), replace the provider with the short_provider
                -- and update the statusline_width variable to reflect the change
                local width_difference = component_widths[section][number] - component_width

                if width_difference > 0 then
                    statusline_width = statusline_width - width_difference
                    component_strs[section][number] = component_str
                    component_widths[section][number] = component_width

                    if component.name then
                        self.component_truncated[winid][component.name] = true
                    end
                end
            end

            if statusline_width <= maxwidth then
                break
            end
        end
    end

    -- If statusline still doesn't fit within window, remove components with truncate_hide set to
    -- true until it does
    if maxwidth and statusline_width > maxwidth then
        for _, indices in ipairs(component_indices) do
            local section, number = indices[1], indices[2]
            local component = sections[section][number]

            if component.truncate_hide then
                statusline_width = statusline_width - component_widths[section][number]
                component_strs[section][number] = ''
                component_widths[section][number] = 0

                if component.name then
                    self.component_truncated[winid][component.name] = true
                    self.component_hidden[winid][component.name] = true
                end
            end

            if statusline_width <= maxwidth then
                break
            end
        end
    end

    -- Concatenate all component strings in each section to get a string for each section
    local section_strs = {}

    for i, section_component_strs in ipairs(component_strs) do
        section_strs[i] = table.concat(section_component_strs)
    end

    -- Finally, concatenate all sections to get the statusline string, and return it
    return table.concat(section_strs, '%=')
end

-- Clear all generator highlights
function Generator:reset_highlights()
    for hl, _ in pairs(self.highlights) do
        vim.cmd('highlight clear ' .. hl)
    end

    self.highlights = {}
end

-- Clear generator state
function Generator:clear_state(reset_highlights)
    if reset_highlights == nil then
        reset_highlights = true
    end

    if reset_highlights then
        self:reset_highlights()
    end

    self.component_hidden = {}
    self.component_truncated = {}
    self.provider_cache = { short = {}, long = {} }
    self.provider_autocmd = {}
    -- Clear provider update autocmds
    utils.create_augroup({}, 'felineProviders' .. self.name, false)
end

return Generator
