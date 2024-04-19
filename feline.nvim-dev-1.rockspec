package = "feline.nvim"
version = "dev-1"
source = {
   url = "git+ssh://git@github.com/freddiehaddad/feline.nvim.git"
}
description = {
   detailed = [[
![GitHub last commit (branch)](https://img.shields.io/github/last-commit/freddiehaddad/feline.nvim/main?style=for-the-badge)
![GitHub (Pre-)Release Date](https://img.shields.io/github/release-date-pre/freddiehaddad/feline.nvim?style=for-the-badge)
![GitHub issues](https://img.shields.io/github/issues/freddiehaddad/feline.nvim?style=for-the-badge)
![GitHub Discussions](https://img.shields.io/github/discussions/freddiehaddad/feline.nvim?style=for-the-badge)
![GitHub Repo stars](https://img.shields.io/github/stars/freddiehaddad/feline.nvim?style=for-the-badge)]],
   homepage = "*** please enter a project homepage ***",
   license = "*** please specify a license ***"
}
build = {
   type = "builtin",
   modules = {
      ["feline.default_components"] = "lua/feline/default_components.lua",
      ["feline.defaults"] = "lua/feline/defaults.lua",
      ["feline.generator"] = "lua/feline/generator.lua",
      ["feline.init"] = "lua/feline/init.lua",
      ["feline.providers.cursor"] = "lua/feline/providers/cursor.lua",
      ["feline.providers.file"] = "lua/feline/providers/file.lua",
      ["feline.providers.git"] = "lua/feline/providers/git.lua",
      ["feline.providers.init"] = "lua/feline/providers/init.lua",
      ["feline.providers.lsp"] = "lua/feline/providers/lsp.lua",
      ["feline.providers.statuscolumn"] = "lua/feline/providers/statuscolumn.lua",
      ["feline.providers.vi_mode"] = "lua/feline/providers/vi_mode.lua",
      ["feline.themes.default"] = "lua/feline/themes/default.lua",
      ["feline.themes.init"] = "lua/feline/themes/init.lua",
      ["feline.utils"] = "lua/feline/utils.lua"
   },
   copy_directories = {
      "doc"
   }
}
