vim.g.mapleader = ","

local plugins = require('plugins')
plugins.install()
plugins.init()

require("keymaps").map()
require("options").init()
require("theme").init()
