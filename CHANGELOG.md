# Changelog

## [1.5.1](https://github.com/freddiehaddad/feline.nvim/compare/v1.5.0...v1.5.1) (2024-04-19)


### Bug Fixes

* register rockspec with luarocks ([#74](https://github.com/freddiehaddad/feline.nvim/issues/74)) ([cfd138c](https://github.com/freddiehaddad/feline.nvim/commit/cfd138cbdeb6266bb7e400f12de4c795079f3be1))

## [1.5.0](https://github.com/freddiehaddad/feline.nvim/compare/v1.4.0...v1.5.0) (2024-04-19)


### Features

* luarocks/rocks.nvim support ([#71](https://github.com/freddiehaddad/feline.nvim/issues/71)) ([acf089e](https://github.com/freddiehaddad/feline.nvim/commit/acf089eecc1c2441f897b283cdfd2b44e4998629))

## [1.4.0](https://github.com/freddiehaddad/feline.nvim/compare/v1.3.4...v1.4.0) (2024-01-05)


### Features

* **providers:** line_percentage padding option ([63df940](https://github.com/freddiehaddad/feline.nvim/commit/63df9405c134efda706f4c264c8dd20810a205d6))

## [1.3.4](https://github.com/freddiehaddad/feline.nvim/compare/v1.3.3...v1.3.4) (2023-12-27)


### Bug Fixes

* only error on termguicolors not set for version.minor &lt; 10 ([9cbace2](https://github.com/freddiehaddad/feline.nvim/commit/9cbace2bc3b6b8082672b8ded41f691cad679e05))

## [1.3.3](https://github.com/freddiehaddad/feline.nvim/compare/v1.3.2...v1.3.3) (2023-11-28)


### Bug Fixes

* merge icon tables preferring user values ([#58](https://github.com/freddiehaddad/feline.nvim/issues/58)) ([a50df1f](https://github.com/freddiehaddad/feline.nvim/commit/a50df1fac6fe04eac1ad5491145ffb8dd2fe22db))

## [1.3.2](https://github.com/freddiehaddad/feline.nvim/compare/v1.3.1...v1.3.2) (2023-11-20)


### Bug Fixes

* **icon:** use component.icon when its not a table ([#49](https://github.com/freddiehaddad/feline.nvim/issues/49)) ([#55](https://github.com/freddiehaddad/feline.nvim/issues/55)) ([1dcf6bf](https://github.com/freddiehaddad/feline.nvim/commit/1dcf6bf0b7fcaf2a2cddec377266eb2e6a41492e))

## [1.3.1](https://github.com/freddiehaddad/feline.nvim/compare/v1.3.0...v1.3.1) (2023-11-20)


### Bug Fixes

* **icon:** prefer component icon over default ([#53](https://github.com/freddiehaddad/feline.nvim/issues/53)) ([77e119d](https://github.com/freddiehaddad/feline.nvim/commit/77e119da2cd129c6dcbcd169ae2cede606d712fd))

## [1.3.0](https://github.com/freddiehaddad/feline.nvim/compare/v1.2.4...v1.3.0) (2023-11-19)


### Features

* missing icon keys will be set to the default ([#49](https://github.com/freddiehaddad/feline.nvim/issues/49)) ([#51](https://github.com/freddiehaddad/feline.nvim/issues/51)) ([b315e31](https://github.com/freddiehaddad/feline.nvim/commit/b315e3173010d6d0cc9886af96df3c293627576d))


### Bug Fixes

* **diagnostics:** disable undefined-field warnings ([#50](https://github.com/freddiehaddad/feline.nvim/issues/50)) ([3eecdab](https://github.com/freddiehaddad/feline.nvim/commit/3eecdabbe1925564f8320638b29e5b1ace2bc8f5))

## [1.2.4](https://github.com/freddiehaddad/feline.nvim/compare/v1.2.3...v1.2.4) (2023-11-18)


### Bug Fixes

* **lsp:** update deprecated function calls ([#47](https://github.com/freddiehaddad/feline.nvim/issues/47)) ([4b0a439](https://github.com/freddiehaddad/feline.nvim/commit/4b0a4395c044302e79d536e739f482a316954954))

## [1.2.3](https://github.com/freddiehaddad/feline.nvim/compare/v1.2.2...v1.2.3) (2023-11-02)


### Bug Fixes

* require neovim 0.9+ due to deprecations ([#38](https://github.com/freddiehaddad/feline.nvim/issues/38)) ([dfb7df1](https://github.com/freddiehaddad/feline.nvim/commit/dfb7df1c11efd829999267211c999e421d07e935))

## [1.2.2](https://github.com/freddiehaddad/feline.nvim/compare/v1.2.1...v1.2.2) (2023-11-02)


### Bug Fixes

* **hl:** use nvim_get_hl due to deprecation ([#36](https://github.com/freddiehaddad/feline.nvim/issues/36)) ([ae40427](https://github.com/freddiehaddad/feline.nvim/commit/ae40427ab57b8163ee3171f605b77da2b7e9b670))

## [1.2.1](https://github.com/freddiehaddad/feline.nvim/compare/v1.2.0...v1.2.1) (2023-09-29)


### Bug Fixes

* **vi_mode:** add default color for confirm ([#33](https://github.com/freddiehaddad/feline.nvim/issues/33)) ([c06efb4](https://github.com/freddiehaddad/feline.nvim/commit/c06efb498d1cc083cde2de563f868308e93f9c49))

## [1.2.0](https://github.com/freddiehaddad/feline.nvim/compare/v1.1.1...v1.2.0) (2023-06-19)


### Features

* **theme:** add theme support for winbar and statuscolumn ([#27](https://github.com/freddiehaddad/feline.nvim/issues/27)) ([db6e3ce](https://github.com/freddiehaddad/feline.nvim/commit/db6e3ce054e309782ac14b333478a11ae9e38188))

## [1.1.1](https://github.com/freddiehaddad/feline.nvim/compare/v1.1.0...v1.1.1) (2023-05-06)


### Bug Fixes

* **git:** use updated nerd font icon for git changed indicator ([#20](https://github.com/freddiehaddad/feline.nvim/issues/20)) ([#21](https://github.com/freddiehaddad/feline.nvim/issues/21)) ([c7998fd](https://github.com/freddiehaddad/feline.nvim/commit/c7998fd078fe0eb1bdb9458a015427ee657a5199))

## [1.1.0](https://github.com/freddiehaddad/feline.nvim/compare/v1.0.1...v1.1.0) (2023-05-01)


### Features

* **statuscolumn:** add statuscolumn support ([#17](https://github.com/freddiehaddad/feline.nvim/issues/17)) ([#18](https://github.com/freddiehaddad/feline.nvim/issues/18)) ([#18](https://github.com/freddiehaddad/feline.nvim/issues/18)) ([25b258f](https://github.com/freddiehaddad/feline.nvim/commit/25b258f52246bd544f3ca09f010ead6d92c9025d))

## [1.0.1](https://github.com/freddiehaddad/feline.nvim/compare/v1.0.0...v1.0.1) (2023-03-18)


### Bug Fixes

* **log:** remove 0.5-combat reference from requirement log message ([#11](https://github.com/freddiehaddad/feline.nvim/issues/11)) ([6efdcd9](https://github.com/freddiehaddad/feline.nvim/commit/6efdcd9403910a484800af06142b2941f0aeffc8))
* **theme:** revert the removal of add_theme ([#9](https://github.com/freddiehaddad/feline.nvim/issues/9)) ([f28c2ec](https://github.com/freddiehaddad/feline.nvim/commit/f28c2ecb3117541799ccef01e25bdf72242f5243)), closes [#8](https://github.com/freddiehaddad/feline.nvim/issues/8)

## 1.0.0 (2023-03-11)


### ⚠ BREAKING CHANGES

* Changes minimum required Neovim version to 0.7. Support for presets is removed.
* The `diagnostics_exist` utility function now takes an integer containing the diagnostic severity instead of a string. For more info, do `:help vim.diagnostic.severity` in Neovim.
* The `colors` configuration option in the setup function now needs to be renamed to `theme`.
* Truncation now requires the `nvim_eval_statusline` API function. As a result, it will not work without the master branch of Neovim.
* `default_hl` is now removed. Set the `StatusLine` and `StatusLineNC` highlights manually to set the highlights for the active and inactive statusline now.
* The statusline providers no longer take a `winid` argument. Now you need to use `vim.api.nvim_get_current_win()` to get the statusline window and `vim.api.nvim_get_current_buf()` for the statusline buffer. For the actual current window / buffer, you need to use `vim.g.actual_curwin` and `vim.g.actual_curbuf`, respectively.  As a result of this change, the `update_triggers` option has also been removed.
* Smart component truncation has been removed and all configuration options that make use of it no longer work.
* Section gaps no longer use the default `bg` color by default, so the section gap highlights need to be specified manually. For more info, see:
* `require('feline.providers').add_provider()` no longer works.
* The arguments for provider functions have been changed.
* Support for old components table format, `default_fg` and `default_bg` and the properties table have all been removed
* Modifying an existing preset is done differently now.
* deprecate `properties` table
* deprecate default_fg and default_bg

### Features

* `macro` provider ([#324](https://github.com/freddiehaddad/feline.nvim/issues/324)) ([59fb7c7](https://github.com/freddiehaddad/feline.nvim/commit/59fb7c719927de2058c3e11da09205914488f255))
* `search_count` provider ([#322](https://github.com/freddiehaddad/feline.nvim/issues/322)) ([c14a931](https://github.com/freddiehaddad/feline.nvim/commit/c14a931b3d64bc51dd7892662cdc557cfd1640fc))
* add `always_visible` option for icons ([58ac1a4](https://github.com/freddiehaddad/feline.nvim/commit/58ac1a4e8d9d428be59ec9efa87e7df35ddd1bac))
* Add `always_visible` separator element ([e85e6a6](https://github.com/freddiehaddad/feline.nvim/commit/e85e6a65759b2f0feaba7b67f4203fdf2f58d264))
* add `custom_providers` configuration option ([791d097](https://github.com/freddiehaddad/feline.nvim/commit/791d0972ac01d9a1537569afde6cd0883cd4e87d))
* add `default_hl` configuration option ([ee998c0](https://github.com/freddiehaddad/feline.nvim/commit/ee998c0f00dccccbb5184deaa1abfa2cbcbaa009))
* Add `git_info_exists` utility function ([ef61784](https://github.com/freddiehaddad/feline.nvim/commit/ef6178495d32a39b2ca2edf5e5cf06142c2293de))
* add `path_sep` option to `file_info` provider ([#304](https://github.com/freddiehaddad/feline.nvim/issues/304)) ([68ff807](https://github.com/freddiehaddad/feline.nvim/commit/68ff807f2906694954c28b7a746c709d60124c9f))
* add `reverse` option to scroll bar provider ([382e868](https://github.com/freddiehaddad/feline.nvim/commit/382e86876f455653f43bddb506f59a2ed4392efb))
* add auto doc workflow ([#76](https://github.com/freddiehaddad/feline.nvim/issues/76)) ([a006159](https://github.com/freddiehaddad/feline.nvim/commit/a006159a373e8eb12e5c877b4a973be2e9f537d7))
* add color theme support ([47dc59e](https://github.com/freddiehaddad/feline.nvim/commit/47dc59e63d444d5e46e7c7aa7595ef6bba44e0b2))
* add fileformat provider ([#177](https://github.com/freddiehaddad/feline.nvim/issues/177)) ([4c6b988](https://github.com/freddiehaddad/feline.nvim/commit/4c6b9887f7e7ca977dd64ed57861102c0e778b8b))
* add mode alias for "nt" ([#156](https://github.com/freddiehaddad/feline.nvim/issues/156)) ([49f21e1](https://github.com/freddiehaddad/feline.nvim/commit/49f21e1f205c217f8669d1c4fb1e5e299dc3f1e2))
* add more configuration options for `position` provider ([#278](https://github.com/freddiehaddad/feline.nvim/issues/278)) ([91580f5](https://github.com/freddiehaddad/feline.nvim/commit/91580f583c3593021b8a168645c18071a47118fb))
* add smart component truncation ([#110](https://github.com/freddiehaddad/feline.nvim/issues/110)) ([f8fb9c2](https://github.com/freddiehaddad/feline.nvim/commit/f8fb9c2100b1e5d67d589195aebfaf1df027c513))
* add smart component truncation ([#132](https://github.com/freddiehaddad/feline.nvim/issues/132)) ([087bc82](https://github.com/freddiehaddad/feline.nvim/commit/087bc8266f538bd49c9b9b02639b88739f43335e))
* add statusline generator benchmark ([3b23c73](https://github.com/freddiehaddad/feline.nvim/commit/3b23c735854a235c7c1868daf45639f4d78e2173))
* add support for conditional components ([#220](https://github.com/freddiehaddad/feline.nvim/issues/220)) ([5bda845](https://github.com/freddiehaddad/feline.nvim/commit/5bda845570391aac54c82ebbe2adfc45ddf98969)), closes [#141](https://github.com/freddiehaddad/feline.nvim/issues/141)
* add utility functions to check component truncation ([#218](https://github.com/freddiehaddad/feline.nvim/issues/218)) ([b89c508](https://github.com/freddiehaddad/feline.nvim/commit/b89c508e0a1fa60b0ed090f4fdf45b18bd465a3b))
* allow all component values to take winid ([#89](https://github.com/freddiehaddad/feline.nvim/issues/89)) ([20172e8](https://github.com/freddiehaddad/feline.nvim/commit/20172e8f20076c08911bc49b602f3a9463843b0b))
* allow better customization of `vi_mode` ([5d5b9cd](https://github.com/freddiehaddad/feline.nvim/commit/5d5b9cde80606e3dd2c0043174afb5add47c4339))
* allow completely disabling statusline ([bd6269d](https://github.com/freddiehaddad/feline.nvim/commit/bd6269d6fc95bffb52ace5df668b63fe468f8bd5))
* allow configuring highlight reset triggers ([b0df1df](https://github.com/freddiehaddad/feline.nvim/commit/b0df1df3dd6fc85582f0d464a6482b484939a270))
* allow configuring position provider padding ([c40adf1](https://github.com/freddiehaddad/feline.nvim/commit/c40adf15be6747d0853f94010ff01733e9133fbd))
* allow configuring presets Feline on the fly ([29b11b5](https://github.com/freddiehaddad/feline.nvim/commit/29b11b5ef0eeb1e2245258706286ffa052da2720))
* allow customizing section gaps ([dc18e87](https://github.com/freddiehaddad/feline.nvim/commit/dc18e8722a98ef5914bb83766ea36fbc3c7def63))
* allow enable() to take winid as argument ([1adf8de](https://github.com/freddiehaddad/feline.nvim/commit/1adf8dec9433ec0bae7e3333b56e7a2e5a0998d1))
* allow omitting provider ([9a296f0](https://github.com/freddiehaddad/feline.nvim/commit/9a296f05df9fd35f03acd6f9ae0f0ed620d756f8))
* allow str and hl of icon and separators to be functions ([d9d04d0](https://github.com/freddiehaddad/feline.nvim/commit/d9d04d0230cf19d98f12e596c3abed85c5ddeba5))
* allow updating providers through triggers ([#232](https://github.com/freddiehaddad/feline.nvim/issues/232)) ([677ce7d](https://github.com/freddiehaddad/feline.nvim/commit/677ce7db1abc469c54333f2abdcbcf2267c4ef10)), closes [#227](https://github.com/freddiehaddad/feline.nvim/issues/227)
* **benchmark:** download profiler.nvim if needed ([0506b42](https://github.com/freddiehaddad/feline.nvim/commit/0506b42b11e9ef6c5c9a3710cb29f8829b33aaa8))
* default to `noicon` without "devicons" ([ae9e609](https://github.com/freddiehaddad/feline.nvim/commit/ae9e609f93dd04e5741018577c9d5bcab6157c5a))
* **file_info:** add `colored_icon` option ([#44](https://github.com/freddiehaddad/feline.nvim/issues/44)) ([8d9dfe1](https://github.com/freddiehaddad/feline.nvim/commit/8d9dfe1f3021c6ecb21a96cfdce9032b30c3a53a))
* **file_info:** add read-only indicator ([#43](https://github.com/freddiehaddad/feline.nvim/issues/43)) ([1c75a91](https://github.com/freddiehaddad/feline.nvim/commit/1c75a91554c4398ed970a4256ac8254b4ed39137))
* **generator:** add icon support for custom providers ([0961775](https://github.com/freddiehaddad/feline.nvim/commit/0961775c8dd84fafcd7a9d92e8a95657385ff847))
* **generator:** add new components table format ([#51](https://github.com/freddiehaddad/feline.nvim/issues/51)) ([8c809b2](https://github.com/freddiehaddad/feline.nvim/commit/8c809b2416fa6773719f3c391eb7b124d67c866e))
* lazy load providers ([fb14810](https://github.com/freddiehaddad/feline.nvim/commit/fb148102dce0b898969eaadc8006d30aef5ee7a8))
* make `force_inactive` and `disable` use Lua patterns ([#92](https://github.com/freddiehaddad/feline.nvim/issues/92)) ([20b8c43](https://github.com/freddiehaddad/feline.nvim/commit/20b8c43e2ca884f71dc6d9fa3f49bb29e8782bc9))
* **providers/git:** show branch name even if no files are opened ([#54](https://github.com/freddiehaddad/feline.nvim/issues/54)) ([092442d](https://github.com/freddiehaddad/feline.nvim/commit/092442db0c7eb6087f0ae2cbeb776781bcc16176))
* Show icon and allow modifying case on filetype provider ([#209](https://github.com/freddiehaddad/feline.nvim/issues/209)) ([7fd8334](https://github.com/freddiehaddad/feline.nvim/commit/7fd8334ce52fdf3cd3ab0fb510175b653e7e0c77))
* switch to semver ([71aa447](https://github.com/freddiehaddad/feline.nvim/commit/71aa4472168f08bf08376fbcf494d5efe7b973fa))
* Use hl as hlgroup if hl is a string or fn-&gt;string ([4f795e7](https://github.com/freddiehaddad/feline.nvim/commit/4f795e78ae8f007cd4f2aa778d4f270c6500dacd))
* **vi_mode:** Add nt mode ([#174](https://github.com/freddiehaddad/feline.nvim/issues/174)) ([9ee565d](https://github.com/freddiehaddad/feline.nvim/commit/9ee565dea8293b7e4eb5b79339311c2b6532d5d7))
* winbar support ([#267](https://github.com/freddiehaddad/feline.nvim/issues/267)) ([791c4b2](https://github.com/freddiehaddad/feline.nvim/commit/791c4b257be4b14e51a1de37582eec600b71663f))


### Bug Fixes

* add default value for custom_providers ([5cf00b5](https://github.com/freddiehaddad/feline.nvim/commit/5cf00b57c33dc0239f498400cb610c5c53251290))
* allow reloading feline configuration ([#231](https://github.com/freddiehaddad/feline.nvim/issues/231)) ([28ee9b8](https://github.com/freddiehaddad/feline.nvim/commit/28ee9b8d05914d1b84ab6502402384b6793b6dc9)), closes [#229](https://github.com/freddiehaddad/feline.nvim/issues/229)
* **benchmark/startup:** add gitsigns setup ([079c614](https://github.com/freddiehaddad/feline.nvim/commit/079c6140e0e7940c01057df3b9b78b87023473eb))
* check if `termguicolors` is set ([4ea98b9](https://github.com/freddiehaddad/feline.nvim/commit/4ea98b94d22170a9cfa2144c8c09a81949cf7300))
* check if provider name is a string ([9c193bc](https://github.com/freddiehaddad/feline.nvim/commit/9c193bca496aa7d27d11ce7432f895167a5d625c))
* clear autocmds when clearing generator state ([#236](https://github.com/freddiehaddad/feline.nvim/issues/236)) ([2b6ff21](https://github.com/freddiehaddad/feline.nvim/commit/2b6ff213d777419859118850b8c48064fad29446))
* clear generator state when components table changes for a window ([#273](https://github.com/freddiehaddad/feline.nvim/issues/273)) ([680129b](https://github.com/freddiehaddad/feline.nvim/commit/680129bdd163aebdb98389e1fc36381af24acebf))
* correctly parse force_inactive and update_triggers config ([8254d59](https://github.com/freddiehaddad/feline.nvim/commit/8254d597998dc47948c0de228c0e035ca46b627b))
* disable truncation on Windows ([#150](https://github.com/freddiehaddad/feline.nvim/issues/150)) ([674ce49](https://github.com/freddiehaddad/feline.nvim/commit/674ce49c3488e4390532375c30d9923761d7ae50))
* don't add name to hl table if it doesn't exist ([d1e4de3](https://github.com/freddiehaddad/feline.nvim/commit/d1e4de364c0b0c0df1ce1c0565549c2b8523fff7))
* Don't append space to empty file_modified_icon ([8d2379f](https://github.com/freddiehaddad/feline.nvim/commit/8d2379f9e2c08abf75107e5f0069c619c0a32067))
* don't defer current window reset ([#64](https://github.com/freddiehaddad/feline.nvim/issues/64)) ([f9dfaa8](https://github.com/freddiehaddad/feline.nvim/commit/f9dfaa8a5a6aeca2b74056f64a0ac6acd3e48ea9))
* don't return defhl if highlight is empty ([39aafe1](https://github.com/freddiehaddad/feline.nvim/commit/39aafe1aab75e2bacd7471f1a95c5b30870d2562))
* don't return hl.name unless it's cached ([e5f5546](https://github.com/freddiehaddad/feline.nvim/commit/e5f5546eb9f888fa90c4034092c82b338a1a63f7))
* don't show error if config is empty ([4cc503a](https://github.com/freddiehaddad/feline.nvim/commit/4cc503a1b50676edd026c6b97552a6c56c0b7b4c))
* don't use global module variable ([#336](https://github.com/freddiehaddad/feline.nvim/issues/336)) ([d48b6f9](https://github.com/freddiehaddad/feline.nvim/commit/d48b6f92c6ccdd6654c956f437be49ea160b5b0c))
* don't use hl if component is empty ([7469aa1](https://github.com/freddiehaddad/feline.nvim/commit/7469aa1a40c9378ae2420727ff704fa6b5ff5aee))
* don't use vim.schedule to defer window update ([3e3f5fd](https://github.com/freddiehaddad/feline.nvim/commit/3e3f5fd760826e01ece4aa50531fa483cc699149))
* ensure config keys exist ([#62](https://github.com/freddiehaddad/feline.nvim/issues/62)) ([fd9dea3](https://github.com/freddiehaddad/feline.nvim/commit/fd9dea3bfaf9dd3f35a7b7d3708acd296379e055))
* ensure that parent_bg has a value ([#74](https://github.com/freddiehaddad/feline.nvim/issues/74)) ([577bc4a](https://github.com/freddiehaddad/feline.nvim/commit/577bc4aacb6ea15c24eda80b031ab30277fca041))
* escape special statusline chars in filename component ([#275](https://github.com/freddiehaddad/feline.nvim/issues/275)) ([fba1aaa](https://github.com/freddiehaddad/feline.nvim/commit/fba1aaa74ceb0df222a556c6ca0db8f303fa893e))
* **file_info:** Don't load devicons if component.icon exists ([e461980](https://github.com/freddiehaddad/feline.nvim/commit/e461980f317ef2e7f43635399f0a83472a07ca73))
* **file_size:** show size of non-existing files as 0. ([66e3245](https://github.com/freddiehaddad/feline.nvim/commit/66e32456ed3c590f2de0f67614bd76843a59b76c))
* fix issue causing truncation to be disabled in Linux ([470d820](https://github.com/freddiehaddad/feline.nvim/commit/470d820354fa2aa6a5a68b7d6205d0d16d8646c5))
* fix LSP provider ([29f5cbf](https://github.com/freddiehaddad/feline.nvim/commit/29f5cbfcecf563df84ac3b0e31e54e7b23e5331f)), closes [#192](https://github.com/freddiehaddad/feline.nvim/issues/192)
* generate correct name for hls with 'NONE' ([8a8cbed](https://github.com/freddiehaddad/feline.nvim/commit/8a8cbeda7874c355001b20c237c10c9d6e96ce43))
* get highlight properties of string highlights ([a02d351](https://github.com/freddiehaddad/feline.nvim/commit/a02d35184dc59a1f07d31a713bca1b7c1c70467b))
* inconsistent length of line_percentage ([d372801](https://github.com/freddiehaddad/feline.nvim/commit/d3728010c1c4960328b8ef479a068ee143be061c)), closes [#48](https://github.com/freddiehaddad/feline.nvim/issues/48)
* Make `disable` work correctly. ([7a1a27f](https://github.com/freddiehaddad/feline.nvim/commit/7a1a27f25c2da3f90e47d1e036b85c3a2b66a58a))
* make `git_info_exists` work properly with `git_branch` ([e6333ef](https://github.com/freddiehaddad/feline.nvim/commit/e6333efb233a323c904a183a011a5f12caeffa6c))
* make `position` provider work correctly with tabs ([#277](https://github.com/freddiehaddad/feline.nvim/issues/277)) ([4218b60](https://github.com/freddiehaddad/feline.nvim/commit/4218b60376e6944fee0316bfe28b32be9aa9c311))
* make colorscheme changes not break feline ([fbd31ae](https://github.com/freddiehaddad/feline.nvim/commit/fbd31ae501a66fe1241c11f890f1deb298f7b2a5))
* make disable inherit correct table ([#68](https://github.com/freddiehaddad/feline.nvim/issues/68)) ([aca917d](https://github.com/freddiehaddad/feline.nvim/commit/aca917d611e7a27a7a883b466844907351c19f26))
* make file_info provider not return a trailing whitespace ([#171](https://github.com/freddiehaddad/feline.nvim/issues/171)) ([996984a](https://github.com/freddiehaddad/feline.nvim/commit/996984a9ba7e4c584fb9a56fb29a653819cd3cb2))
* make force_inactive and disable work correctly ([6295bd2](https://github.com/freddiehaddad/feline.nvim/commit/6295bd2b82a725d5389c897f9dc4cd350a251552))
* make gaps between section respect bg color ([a678974](https://github.com/freddiehaddad/feline.nvim/commit/a67897405f23cce54473d2afbc1a7df63688b815))
* make icon hl fallback to default colors ([b63bc47](https://github.com/freddiehaddad/feline.nvim/commit/b63bc479cc175fd8c3a2a6fefc8226b321d885b4))
* make is_disabled() actually use the settings ([40ae5a6](https://github.com/freddiehaddad/feline.nvim/commit/40ae5a654c9097aa2b4a6884da2cd67e2eaa8315))
* make minimal init and benchmark work with Windows ([758dc26](https://github.com/freddiehaddad/feline.nvim/commit/758dc261984bf5912b1d5c413532a29478c21a61))
* make minimal init work ([#286](https://github.com/freddiehaddad/feline.nvim/issues/286)) ([2962c8c](https://github.com/freddiehaddad/feline.nvim/commit/2962c8c4a67f41ef35c58aa367ff2afb7a9691d3))
* make position provider column number start from 1 ([8329e5b](https://github.com/freddiehaddad/feline.nvim/commit/8329e5bf1fe8ac49eb47234f1aa48492069de5fb))
* make reset_highlights update inactive windows ([bdf92b3](https://github.com/freddiehaddad/feline.nvim/commit/bdf92b3af39e84cd33c0e79c9a8ce51241d876f7))
* make reset_highlights work roperly ([c7b29c2](https://github.com/freddiehaddad/feline.nvim/commit/c7b29c2c1a79e1877dd4a6322d72f499f7da66fc))
* make statusline update in all windows ([#55](https://github.com/freddiehaddad/feline.nvim/issues/55)) ([a870c07](https://github.com/freddiehaddad/feline.nvim/commit/a870c07fdbb7dadbd126594d2bd464cf56a5e552))
* make string providers and `enabled` work properly ([6b49a17](https://github.com/freddiehaddad/feline.nvim/commit/6b49a17418de65a6fedbcdea6ed78b51432d2719))
* make table providers properly return icons ([c9d5ef7](https://github.com/freddiehaddad/feline.nvim/commit/c9d5ef774460a92d06860b342379dd707c1315b5))
* make truncation work on Windows ([5282250](https://github.com/freddiehaddad/feline.nvim/commit/5282250bdea813c13edac0cbc60e4aeb12be1147))
* make vi_mode work correctly when component icon is set ([1b973c9](https://github.com/freddiehaddad/feline.nvim/commit/1b973c9b9c0203f6f50eeed8f0af0befe574b56e))
* never generate empty string for statusline ([128cdc9](https://github.com/freddiehaddad/feline.nvim/commit/128cdc9e81296019930b1b72564c361855d097d3))
* only check buffer local gitsigns info ([6f7c7e7](https://github.com/freddiehaddad/feline.nvim/commit/6f7c7e715f8049642baae018939011c2f07043b6))
* output error messages correctly ([fe943cf](https://github.com/freddiehaddad/feline.nvim/commit/fe943cf09fca5db5a6594a5be2249e99a5c280c7))
* packer error on minimal_init.lua ([#317](https://github.com/freddiehaddad/feline.nvim/issues/317)) ([5d6a054](https://github.com/freddiehaddad/feline.nvim/commit/5d6a054c476f2c2e3de72022d8f59764e53946ee))
* **parse_hl:** make hl inherit parent_hl style ([7b7fa0f](https://github.com/freddiehaddad/feline.nvim/commit/7b7fa0fc599a7795ac27f1725f34e0353ff65fd9))
* **preset:** fix inactive statusline highlights ([0662e5b](https://github.com/freddiehaddad/feline.nvim/commit/0662e5b8292a558fe7273dda4c2adc809586d496))
* **provider/file:** correctly get file extensions ([#254](https://github.com/freddiehaddad/feline.nvim/issues/254)) ([06dda63](https://github.com/freddiehaddad/feline.nvim/commit/06dda63dd58ee64316ac56defeb68ba5cc275be1))
* **provider/file:** use correct icon for buffers not linked to a file ([#251](https://github.com/freddiehaddad/feline.nvim/issues/251)) ([d7b8c67](https://github.com/freddiehaddad/feline.nvim/commit/d7b8c6706ff4cc5d57e0a8fc06bb8f9287792a10))
* **provider:** `search_count` deal with empty/incomplete results ([#329](https://github.com/freddiehaddad/feline.nvim/issues/329)) ([7e2cfa1](https://github.com/freddiehaddad/feline.nvim/commit/7e2cfa14ea0619c703b216e38ebf758f0aad9f37))
* **providers/file_info:** don't transform the empty filename ([#243](https://github.com/freddiehaddad/feline.nvim/issues/243)) ([3a9ff03](https://github.com/freddiehaddad/feline.nvim/commit/3a9ff036e9255e363e0857406f00b0fe8c3487a8))
* **providers/file_info:** Remove unnecessary trailing space ([#214](https://github.com/freddiehaddad/feline.nvim/issues/214)) ([082174a](https://github.com/freddiehaddad/feline.nvim/commit/082174a4e52756e109d19ba959b1291b9683ef55))
* **providers:** add missing vim modes ([#290](https://github.com/freddiehaddad/feline.nvim/issues/290)) ([a6e9ce4](https://github.com/freddiehaddad/feline.nvim/commit/a6e9ce4514aeee1933c46354cbd91ca72e38cff5))
* **providers:** search_count with empty results ([#332](https://github.com/freddiehaddad/feline.nvim/issues/332)) ([573e6d1](https://github.com/freddiehaddad/feline.nvim/commit/573e6d1e213de976256c84e1cb2f55665549b828))
* remove duplicate `mode_alias` index ([#230](https://github.com/freddiehaddad/feline.nvim/issues/230)) ([2c26a34](https://github.com/freddiehaddad/feline.nvim/commit/2c26a348222592a2b1354266b75ff1530ef2d619))
* remove print statement ([4ef5e15](https://github.com/freddiehaddad/feline.nvim/commit/4ef5e1516395eea731275e0f58b6bfba5c6ac9c1))
* remove print statement ([#320](https://github.com/freddiehaddad/feline.nvim/issues/320)) ([f26dd12](https://github.com/freddiehaddad/feline.nvim/commit/f26dd12e5b0e39a8dd2abcb46066c250b5651de9))
* show "[No Name]" instead of "unnamed" for unnamed buffers ([#217](https://github.com/freddiehaddad/feline.nvim/issues/217)) ([92806e9](https://github.com/freddiehaddad/feline.nvim/commit/92806e96b2b6a84823f694449fc0ebb9857378dd))
* show correct component number on error ([528d6ec](https://github.com/freddiehaddad/feline.nvim/commit/528d6ec3a29c0d1ce6afcd145d02965f4207f61e))
* update all windows after update triggers ([#120](https://github.com/freddiehaddad/feline.nvim/issues/120)) ([c7eedbb](https://github.com/freddiehaddad/feline.nvim/commit/c7eedbb6981ca14dff02b93b8516c8d011cdd9a7))
* use colors.fg as default value of parent_bg ([9685971](https://github.com/freddiehaddad/feline.nvim/commit/9685971de476a4468a01d00f3d6eee527bad61d5))
* use column number instead of byte index for position ([287ae68](https://github.com/freddiehaddad/feline.nvim/commit/287ae68164dc17abbeea47b3bf78c50a1eff0dcc))
* use correct maximum width for global statusline ([#237](https://github.com/freddiehaddad/feline.nvim/issues/237)) ([293a3de](https://github.com/freddiehaddad/feline.nvim/commit/293a3de450758030d7ababea205643113f7113ce))
* use nvim-web-devicons correctly in file providers ([#256](https://github.com/freddiehaddad/feline.nvim/issues/256)) ([c2d86f8](https://github.com/freddiehaddad/feline.nvim/commit/c2d86f8110a7c397719203062203a0eea8c02d0e))


### Performance Improvements

* don't store component indices unless needed ([e8a7801](https://github.com/freddiehaddad/feline.nvim/commit/e8a780173209fb5e2fd3a248496e06135064fbc6))
* don't use the # operator ([4a42220](https://github.com/freddiehaddad/feline.nvim/commit/4a42220ebccdd499bd5398cb4c3be12890e0d6d1))
* **generator:** some optimizations ([cb85842](https://github.com/freddiehaddad/feline.nvim/commit/cb85842e7343573d24fb237181b1a54a1b39e802))
* improve highlight caching ([e871469](https://github.com/freddiehaddad/feline.nvim/commit/e8714694db9c3da574e19380b6537a0ae332bdae))
* **presets:** only load the preset being used ([a703bed](https://github.com/freddiehaddad/feline.nvim/commit/a703bed33b30f41fe73b50c85b5434f9ee6762f1))
* Replace vim.cmd with vim.api.nvim_command ([b943a1e](https://github.com/freddiehaddad/feline.nvim/commit/b943a1ea99c857982295e6313c440423f9575b7a))
* some optimizations ([86c92f3](https://github.com/freddiehaddad/feline.nvim/commit/86c92f34ec312809ab8329924c228d503d287d67))
* use string.format instead of concatenation ([a473c77](https://github.com/freddiehaddad/feline.nvim/commit/a473c77ddac5f7c4fa7cbaa895d995f736491b1a))


### Code Refactoring

* deprecate `properties` table ([617a4a6](https://github.com/freddiehaddad/feline.nvim/commit/617a4a61634d95b08b86c4d7b9280a0431a08002))
* deprecate default_fg and default_bg ([d204113](https://github.com/freddiehaddad/feline.nvim/commit/d204113bafb34469f559178b51dfb578a824719f))
* evaluate providers in context of statusline window ([#135](https://github.com/freddiehaddad/feline.nvim/issues/135)) ([f3b4691](https://github.com/freddiehaddad/feline.nvim/commit/f3b4691ee91d0bd900d448dc28b58d9c13fb1882))
* make presets return the components table ([397f7db](https://github.com/freddiehaddad/feline.nvim/commit/397f7db2d9ecc78abf4a233bfc1adeec8321c0ff))
* modify how providers are added ([ce8ea32](https://github.com/freddiehaddad/feline.nvim/commit/ce8ea32c705a688015b374ba01ceb384380499c9))
* remove `default_hl` ([c8af386](https://github.com/freddiehaddad/feline.nvim/commit/c8af386870519cd25575ee149558e2cc96158ae9))
* remove component truncation ([7686dcb](https://github.com/freddiehaddad/feline.nvim/commit/7686dcb6e15c199385d84ec15ed8c049dfda7d48))
* remove deprecated features ([aeeb7b4](https://github.com/freddiehaddad/feline.nvim/commit/aeeb7b4e741660d2573787182b5f1d5b2b6ebf11))
* separate provider options from component values ([#102](https://github.com/freddiehaddad/feline.nvim/issues/102)) ([5adbe55](https://github.com/freddiehaddad/feline.nvim/commit/5adbe5556c530696a76fb8c12f249bc98ed22314))
* use vim.diagnostic for lsp provider ([6be9ca2](https://github.com/freddiehaddad/feline.nvim/commit/6be9ca2d26b704d4df91a3199cd0c2ab870ac9d8))
