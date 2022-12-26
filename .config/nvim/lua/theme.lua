local M = {}

function M.init()
	-- set the colorscheme
	vim.o.background = "dark" -- or "light" for light mode
	vim.cmd([[colorscheme gruvbox]])

	vim.opt.termguicolors = true

	-- Change the characther used for indent lines, based on level of indention
	vim.g.indent_blankline_char_list = {'|', '¦', '┆', '┊'}
end

return M
