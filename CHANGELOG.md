# Changelog

## [1.0.0](https://github.com/freddiehaddad/feline.nvim/compare/v0.4.1...v1.0.0) (2023-03-11)


### ⚠ BREAKING CHANGES

* Changes minimum required Neovim version to 0.7. Support for presets is removed.

### Features

* `macro` provider ([#324](https://github.com/freddiehaddad/feline.nvim/issues/324)) ([59fb7c7](https://github.com/freddiehaddad/feline.nvim/commit/59fb7c719927de2058c3e11da09205914488f255))
* `search_count` provider ([#322](https://github.com/freddiehaddad/feline.nvim/issues/322)) ([c14a931](https://github.com/freddiehaddad/feline.nvim/commit/c14a931b3d64bc51dd7892662cdc557cfd1640fc))
* add `path_sep` option to `file_info` provider ([#304](https://github.com/freddiehaddad/feline.nvim/issues/304)) ([68ff807](https://github.com/freddiehaddad/feline.nvim/commit/68ff807f2906694954c28b7a746c709d60124c9f))
* add `reverse` option to scroll bar provider ([382e868](https://github.com/freddiehaddad/feline.nvim/commit/382e86876f455653f43bddb506f59a2ed4392efb))
* add more configuration options for `position` provider ([#278](https://github.com/freddiehaddad/feline.nvim/issues/278)) ([91580f5](https://github.com/freddiehaddad/feline.nvim/commit/91580f583c3593021b8a168645c18071a47118fb))
* add support for conditional components ([#220](https://github.com/freddiehaddad/feline.nvim/issues/220)) ([5bda845](https://github.com/freddiehaddad/feline.nvim/commit/5bda845570391aac54c82ebbe2adfc45ddf98969)), closes [#141](https://github.com/freddiehaddad/feline.nvim/issues/141)
* add utility functions to check component truncation ([#218](https://github.com/freddiehaddad/feline.nvim/issues/218)) ([b89c508](https://github.com/freddiehaddad/feline.nvim/commit/b89c508e0a1fa60b0ed090f4fdf45b18bd465a3b))
* allow updating providers through triggers ([#232](https://github.com/freddiehaddad/feline.nvim/issues/232)) ([677ce7d](https://github.com/freddiehaddad/feline.nvim/commit/677ce7db1abc469c54333f2abdcbcf2267c4ef10)), closes [#227](https://github.com/freddiehaddad/feline.nvim/issues/227)
* Show icon and allow modifying case on filetype provider ([#209](https://github.com/freddiehaddad/feline.nvim/issues/209)) ([7fd8334](https://github.com/freddiehaddad/feline.nvim/commit/7fd8334ce52fdf3cd3ab0fb510175b653e7e0c77))
* winbar support ([#267](https://github.com/freddiehaddad/feline.nvim/issues/267)) ([791c4b2](https://github.com/freddiehaddad/feline.nvim/commit/791c4b257be4b14e51a1de37582eec600b71663f))


### Bug Fixes

* allow reloading feline configuration ([#231](https://github.com/freddiehaddad/feline.nvim/issues/231)) ([28ee9b8](https://github.com/freddiehaddad/feline.nvim/commit/28ee9b8d05914d1b84ab6502402384b6793b6dc9)), closes [#229](https://github.com/freddiehaddad/feline.nvim/issues/229)
* clear autocmds when clearing generator state ([#236](https://github.com/freddiehaddad/feline.nvim/issues/236)) ([2b6ff21](https://github.com/freddiehaddad/feline.nvim/commit/2b6ff213d777419859118850b8c48064fad29446))
* clear generator state when components table changes for a window ([#273](https://github.com/freddiehaddad/feline.nvim/issues/273)) ([680129b](https://github.com/freddiehaddad/feline.nvim/commit/680129bdd163aebdb98389e1fc36381af24acebf))
* don't use global module variable ([#336](https://github.com/freddiehaddad/feline.nvim/issues/336)) ([d48b6f9](https://github.com/freddiehaddad/feline.nvim/commit/d48b6f92c6ccdd6654c956f437be49ea160b5b0c))
* escape special statusline chars in filename component ([#275](https://github.com/freddiehaddad/feline.nvim/issues/275)) ([fba1aaa](https://github.com/freddiehaddad/feline.nvim/commit/fba1aaa74ceb0df222a556c6ca0db8f303fa893e))
* make `position` provider work correctly with tabs ([#277](https://github.com/freddiehaddad/feline.nvim/issues/277)) ([4218b60](https://github.com/freddiehaddad/feline.nvim/commit/4218b60376e6944fee0316bfe28b32be9aa9c311))
* make minimal init work ([#286](https://github.com/freddiehaddad/feline.nvim/issues/286)) ([2962c8c](https://github.com/freddiehaddad/feline.nvim/commit/2962c8c4a67f41ef35c58aa367ff2afb7a9691d3))
* only check buffer local gitsigns info ([6f7c7e7](https://github.com/freddiehaddad/feline.nvim/commit/6f7c7e715f8049642baae018939011c2f07043b6))
* packer error on minimal_init.lua ([#317](https://github.com/freddiehaddad/feline.nvim/issues/317)) ([5d6a054](https://github.com/freddiehaddad/feline.nvim/commit/5d6a054c476f2c2e3de72022d8f59764e53946ee))
* **provider/file:** correctly get file extensions ([#254](https://github.com/freddiehaddad/feline.nvim/issues/254)) ([06dda63](https://github.com/freddiehaddad/feline.nvim/commit/06dda63dd58ee64316ac56defeb68ba5cc275be1))
* **provider/file:** use correct icon for buffers not linked to a file ([#251](https://github.com/freddiehaddad/feline.nvim/issues/251)) ([d7b8c67](https://github.com/freddiehaddad/feline.nvim/commit/d7b8c6706ff4cc5d57e0a8fc06bb8f9287792a10))
* **provider:** `search_count` deal with empty/incomplete results ([#329](https://github.com/freddiehaddad/feline.nvim/issues/329)) ([7e2cfa1](https://github.com/freddiehaddad/feline.nvim/commit/7e2cfa14ea0619c703b216e38ebf758f0aad9f37))
* **providers/file_info:** don't transform the empty filename ([#243](https://github.com/freddiehaddad/feline.nvim/issues/243)) ([3a9ff03](https://github.com/freddiehaddad/feline.nvim/commit/3a9ff036e9255e363e0857406f00b0fe8c3487a8))
* **providers/file_info:** Remove unnecessary trailing space ([#214](https://github.com/freddiehaddad/feline.nvim/issues/214)) ([082174a](https://github.com/freddiehaddad/feline.nvim/commit/082174a4e52756e109d19ba959b1291b9683ef55))
* **providers:** add missing vim modes ([#290](https://github.com/freddiehaddad/feline.nvim/issues/290)) ([a6e9ce4](https://github.com/freddiehaddad/feline.nvim/commit/a6e9ce4514aeee1933c46354cbd91ca72e38cff5))
* **providers:** search_count with empty results ([#332](https://github.com/freddiehaddad/feline.nvim/issues/332)) ([573e6d1](https://github.com/freddiehaddad/feline.nvim/commit/573e6d1e213de976256c84e1cb2f55665549b828))
* remove duplicate `mode_alias` index ([#230](https://github.com/freddiehaddad/feline.nvim/issues/230)) ([2c26a34](https://github.com/freddiehaddad/feline.nvim/commit/2c26a348222592a2b1354266b75ff1530ef2d619))
* remove print statement ([#320](https://github.com/freddiehaddad/feline.nvim/issues/320)) ([f26dd12](https://github.com/freddiehaddad/feline.nvim/commit/f26dd12e5b0e39a8dd2abcb46066c250b5651de9))
* show "[No Name]" instead of "unnamed" for unnamed buffers ([#217](https://github.com/freddiehaddad/feline.nvim/issues/217)) ([92806e9](https://github.com/freddiehaddad/feline.nvim/commit/92806e96b2b6a84823f694449fc0ebb9857378dd))
* show correct component number on error ([528d6ec](https://github.com/freddiehaddad/feline.nvim/commit/528d6ec3a29c0d1ce6afcd145d02965f4207f61e))
* use correct maximum width for global statusline ([#237](https://github.com/freddiehaddad/feline.nvim/issues/237)) ([293a3de](https://github.com/freddiehaddad/feline.nvim/commit/293a3de450758030d7ababea205643113f7113ce))
* use nvim-web-devicons correctly in file providers ([#256](https://github.com/freddiehaddad/feline.nvim/issues/256)) ([c2d86f8](https://github.com/freddiehaddad/feline.nvim/commit/c2d86f8110a7c397719203062203a0eea8c02d0e))
