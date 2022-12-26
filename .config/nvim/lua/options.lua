local M = {}

function M.init()
	vim.opt.encoding = "utf-8"
	vim.opt.relativenumber = true -- enable absolute numbering of current line and relative of other lines
	vim.opt.breakindent = true -- for having the wrapping lines use the indention level

	vim.opt.scrolloff = 7
	vim.opt.backspace = 'indent,eol,start'
	vim.opt.tabstop = 4
	vim.opt.softtabstop = 4
	vim.opt.shiftwidth = 4
	vim.opt.autoindent = true
	vim.opt.fileformat = "unix"

	-- For enabling conditional case insesitive search
	vim.opt.ignorecase = true
	vim.opt.smartcase = true

	vim.opt.clipboard:append{ "unnamedplus" } -- copy to system clipboard

	vim.opt.splitbelow = true
	vim.opt.splitright = true

	vim.opt.hidden = true -- For allowing switching of buffers without saving or discarding

	vim.notify = require("notify")

	-- Disable default file-explorer as we use nvim-tree
	vim.g.loaded_netrw = 1
	vim.g.loaded_netrwPlugin = 1
end

return M
