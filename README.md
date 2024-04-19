# feline.nvim

![GitHub last commit (branch)](https://img.shields.io/github/last-commit/freddiehaddad/feline.nvim/main?style=for-the-badge)
![GitHub (Pre-)Release Date](https://img.shields.io/github/release-date-pre/freddiehaddad/feline.nvim?style=for-the-badge)
![GitHub issues](https://img.shields.io/github/issues/freddiehaddad/feline.nvim?style=for-the-badge)
![GitHub Discussions](https://img.shields.io/github/discussions/freddiehaddad/feline.nvim?style=for-the-badge)
![GitHub Repo stars](https://img.shields.io/github/stars/freddiehaddad/feline.nvim?style=for-the-badge)

A minimal, stylish and customizable statusline, statuscolumn, and winbar for
Neovim

Active Window
![scrn-2023-11-02-05-54-47](https://github.com/freddiehaddad/feline.nvim/assets/6127369/e2dbda10-b9de-446f-9236-20896cf1fa98)

Active Window with macro and search indicators
![scrn-2023-11-02-05-58-19](https://github.com/freddiehaddad/feline.nvim/assets/6127369/4bc4edf5-3613-428a-891c-2a111b46df6b)

Inactive Window
![scrn-2023-11-02-05-55-10](https://github.com/freddiehaddad/feline.nvim/assets/6127369/48e0fb94-542a-47f3-b965-7a8482615e67)

Neovim, Feline and matching Tmux Theme
![scrn-2023-11-02-06-03-05](https://github.com/freddiehaddad/feline.nvim/assets/6127369/80c8ee6a-40c5-43ff-8122-9b0f029182c3)

Configuration can be found in the following [repo] within [feline.lua].

## About

Feline is a Lua statusline, statuscolumn and winbar plugin that prioritizes
speed, customizability and minimalism. It's fast and never gets in your way.
Feline only provides you with the necessary tools that you need to configure
these UI elements to your liking and avoids feature-bloat. It's also extremely
customizable and allows you to configure it in any way you wish to. Feline also
has reasonable defaults for those who don't want to configure things and just
want a good out of the box experience.

The author of `feline.nvim` has stepped down from maintaining this project. This
repository is the plugins new home as per
[reddit discussion](https://www.reddit.com/r/neovim/comments/116av04/comment/j99m5hj/?context=3).

## Features

- Ease-of-use.

- Complete customizability over every component.

- [Built-in providers] such as:

  - Vi-mode
  - File info
  - Cursor position
  - Diagnostics (using [Neovim's built-in LSP])
  - Git branch and diffs (using [gitsigns.nvim])

  and many more

- Minimalistic, only provides the bare minimum and allows the user to build
  their own components very easily.

- Winbar support.

- Statuscolumn support.

## Requirements

- Necessary
  - Neovim v0.9+
  - 24-bit RGB color enabled in Neovim (do `:help 'termguicolors'` in Neovim for
    more info)
- Optional
  - [nvim-web-devicons] - For icon support
  - [A patched font] - For icon support
  - [gitsigns.nvim] - For git providers

## Installation

This plugin is available on [LuaRocks]:

```text
:Rocks install feline.nvim
```

[lazy.nvim]

```lua
-- default
{
    'freddiehaddad/feline.nvim',
    opts = {}
}

-- with extras
{
    'freddiehaddad/feline.nvim',
    opts = {},
    config = function(_, opts)
        require('feline').setup()
        require('feline').winbar.setup()       -- to use winbar
        require('feline').statuscolumn.setup() -- to use statuscolumn

        require('feline').use_theme()          -- to use a custom theme
    end
}
```

[packer.nvim]

```lua
use 'freddiehaddad/feline.nvim'
```

[vim-plug]

```vim
Plug 'freddiehaddad/feline.nvim'
```

## Getting started

### Using the default configuration

Once you've installed Feline, it's extremely easy to get started with it. If you
don't mind using the default settings, you can just call Feline's `setup()`
function in your configuration. Like this:

```lua
require('feline').setup()
```

If you want to set up the `'winbar'` alongside the statusline, just add this
line next to the previous line:

```lua
require('feline').winbar.setup()
```

If you want to set up the `'statuscolumn'` alongside the statusline, just add
this line next to the previous line:

```lua
require('feline').statuscolumn.setup()
```

### Configuring Feline to fit your needs

If the default configuration doesn't suit your needs, Feline provides plenty of
customization options enabling you to configure everything exactly how you want.
The only prerequisite is knowing the basics of Lua. Refer to the [USAGE]
documentation or use `:help feline.txt` inside Neovim to read the USAGE docs.
Additionally, you may find it helpful to look at the community configurations.

## Help

### Common issues

#### Feline crashes or disappears for seemingly no reason

This can be caused by conflicting plugins modifying the winbar, statuscolumn or
statusbar along with Feline. The statusline is a core piece of functionality of
Feline and can't easily be disabled. However, the optional components can be. If
another plugin is modifying any of these components, then do not enable them in
Feline.

### Reporting issues or feature requests

If you have an issue that you can't find the fix to in the documentation or want
to request a feature you think is absolutely necessary, feel free to open a new
[Issue] and I will try my best to look into it. If you want to contribute to
Feline, you can make a Pull Request. For more details, please see:
[CONTRIBUTING]

## Why Feline?

Now, you might be thinking, why do we need another statusline plugin? We've
already got a bunch of brilliant statusline plugins like galaxyline, airline,
lualine, expressline etc. and all of them are excellent. So then, why Feline?

I'd like to preface this by saying that what I'm about to say can be (and
probably is) very biased and opinionated. Take what's being said here with a
grain of salt. All of this is purely my opinion and not a fact by any means, so
it's fine to disagree. Moreover, any statement I make here may be incorrect or
outdated. In which case, please feel free to open an [Issue or Pull Request]
correcting it.

I think that despite those plugins being neat, each have their own shortcomings.
I find those shortcomings as too much to ignore. For example, most of the
statusline plugins are not very customizable and the plugins only provide a
limited amount of tools and options for customization. Feline, on the other
hand, is built for customizability from the ground up. You are not limited in
any way by what the plugin provides. You can control every individual component
and its location, appearance, everything about it.

Feline is also fast and never gets in your way. It lazy-loads most of its
modules, which allows it to start up instantly. Statusline updates with Feline
are also blazing fast, which provides for a really smooth experience.

Feline is minimal and only implements the bare minimum required for you to get
started. It both expects and invites you to make your own components and
providers, because nobody understands you better than yourself. To help you do
that, Feline provides all the tools and options you would need while also giving
you a solid foundation to build from. One could say that the real goal of Feline
is to make creating your own statusline as easy for you as possible, while also
providing reasonable defaults that should be enough for most people.

Documentation is another aspect where I found most statusline plugins to be very
lacking. Feline is extremely easy to configure and well-documented, which allows
anyone to be able to build their statusline as they wish to. It provides example
for every option to allow anyone to easily understand the purpose of any option

Lastly, anyone is welcome to contribute to Feline, either by making an Issue or
through a Pull Request (see [CONTRIBUTING] for further information). Any kind of
contribution starting from fixing a minor typo to adding a massive new feature
is welcome.

And this plugin is named after cats, you won't get that anywhere else.

## Screenshots

**NOTE: Some of these configurations may be outdated and may need to be changed
prior to use. A few of the configurations are missing a link because the link to
them was removed due to the link no longer being valid.**

**Default setup:**
![image](https://user-images.githubusercontent.com/29580810/114544000-d3028400-9c7b-11eb-856c-2feb166334b2.png)

**Default no-icons setup:**
![image](https://user-images.githubusercontent.com/29580810/114742106-36201380-9d6d-11eb-9866-e8c0fef8a1bd.png)

**[Config by freddiehaddad:](https://github.com/freddiehaddad/feline.nvim/discussions/2)**
![image](https://user-images.githubusercontent.com/6127369/220177261-668841ca-3128-436f-8879-62f145261399.png)

**[Config by crivotz:](https://github.com/crivotz/nv-ide/blob/master/lua/config/plugins/feline.lua)**
![image](https://user-images.githubusercontent.com/3275600/114841377-0ce89d00-9dd8-11eb-82b4-b3ee332771c2.png)

**[Config by 6cdh:](https://github.com/6cdh/dotfiles/blob/62959d27344dade28d6dd638252cd82accb309ab/nvim/.config/nvim/lua/statusline.lua)**
![image](https://user-images.githubusercontent.com/39000776/114838041-e68e2600-9e06-11eb-9334-431a627ff144.png)

**Config by luizcoro2:**
![image](https://user-images.githubusercontent.com/70335871/115327167-dd81b980-a164-11eb-9c02-7a3a1b6a94b5.png)

**Config by rafamadriz (classic):**

**Gruvbox:**
![image](https://user-images.githubusercontent.com/67771985/116002735-a7bc5500-a5ea-11eb-82e3-86d1837902cf.png)
**Nord:**
![image](https://user-images.githubusercontent.com/67771985/116002779-d3d7d600-a5ea-11eb-8772-7cb85d7bc324.png)

**Config by rafamadriz (slant):**

**Gruvbox:**
![image](https://user-images.githubusercontent.com/67771985/116002799-e94d0000-a5ea-11eb-9472-da0d75bbcceb.png)
**Nord:**
![image](https://user-images.githubusercontent.com/67771985/116002808-efdb7780-a5ea-11eb-97eb-caf7875e9a3d.png)

**Config by rafamadriz (VSCode):**
![image](https://user-images.githubusercontent.com/67771985/117713773-9d42b380-b1c5-11eb-8a8b-76949c9b2db1.png)

**[Config by pianocomposer321:](https://gist.github.com/pianocomposer321/6151c458132a97590d21415db67361a6)**
![image](https://user-images.githubusercontent.com/54072354/117869424-65d51500-b260-11eb-898c-0a0b987a6275.png)

**Config by iBhagwan:**
![image](https://user-images.githubusercontent.com/59988195/133922136-3d037c37-7a3f-4e1b-b42e-c50b22fedfdb.png)

**[Config by EdenEast](https://github.com/EdenEast/nyx/blob/8a9819e/config/.config/nvim/lua/eden/modules/ui/feline/init.lua)**
(Colors generated from applied colorscheme)

**Nightfox**
![image](https://user-images.githubusercontent.com/2746374/137549252-333f074e-47a0-464f-ac8a-7ce0ee43433c.png)

**Dayfox**
![image](https://user-images.githubusercontent.com/2746374/137549328-eb5f51c2-bd7b-4c9e-9080-b6132b688459.png)

**[Config by toufyx](https://gist.github.com/Toufyx/d6b48a0a12ceff02268be49db0a97ddf)**
![image](https://user-images.githubusercontent.com/10991276/187600545-034cf707-08c9-456e-af3e-6d4baf1580a9.png)

**[Config by Hitesh-Aggarwal](https://github.com/Hitesh-Aggarwal/feline_one_monokai.nvim/blob/2ff798d4d0435d2145593587dc93a70e72a6d279/plugin/feline_one_monokai.lua)**
![image](https://raw.githubusercontent.com/Hitesh-Aggarwal/feline_one_monokai.nvim/2ff798d4d0435d2145593587dc93a70e72a6d279/screenshot.png)

**[Config by Dharmx](https://gist.github.com/dharmx/47139967b0c4303572e3742af725300c)**
![image](https://user-images.githubusercontent.com/80379926/205459030-1ef38f4f-b364-43ea-876e-db98549c38cd.png)

To share your configuration, start a discussion following this
[example](https://github.com/freddiehaddad/feline.nvim/discussions/2).

## LICENSE

Feline is licensed under GNU GPLv3. For more info, see: [LICENSE.md].

## Naming

The name of this plugin is a silly pun based on the convention of the names of
statusline plugins ending with 'line', while also being named after cats. And in
a way this statusline is supposed to be as quick as a cat's instincts, so I
guess the name fits.

[a patched font]: https://github.com/ryanoasis/nerd-fonts
[built-in providers]: USAGE.md#default-providers
[contributing]: CONTRIBUTING.md
[feline.lua]: https://github.com/freddiehaddad/nvim/blob/main/lua/plugins/feline.lua
[gitsigns.nvim]: https://github.com/lewis6991/gitsigns.nvim/
[issue]: https://github.com/freddiehaddad/feline.nvim/issues
[issue or pull request]: CONTRIBUTING.md
[lazy.nvim]: https://github.com/folke/lazy.nvim
[license.md]: LICENSE.md
[luarocks]: https://luarocks.org/modules/freddiehaddad/feline.nvim
[neovim's built-in lsp]: https://neovim.io/doc/user/lsp.html
[nvim-web-devicons]: https://github.com/kyazdani42/nvim-web-devicons/
[packer.nvim]: https://github.com/wbthomason/packer.nvim/
[repo]: https://github.com/freddiehaddad/nvim
[usage]: USAGE.md
[vim-plug]: https://github.com/junegunn/vim-plug/
