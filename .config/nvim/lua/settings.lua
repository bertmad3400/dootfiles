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

-- Lualine
require('lualine').setup({ options = {
		theme = "gruvbox",
		icons_enabled = true
	}
})


-- Treesitter
require('nvim-treesitter.configs').setup({
	ensure_installed = { "python", "svelte", "lua", "json", "yaml",
		"typescript", "sxhkdrc", "markdown", "html", "bash", "css", "diff",
		"latex", "javascript" },

	auto_install = true,

	highlight = {
		enable = true,
		disable = function(lang, buf)
			local max_filesize = 500 * 1024 -- 500 KB
			local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
			if ok and stats and stats.size > max_filesize then
				return true
			end
		end,
	},
	indent = {
		enable = true
	},
})


-- File-explorer
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require('nvim-tree').setup({
  open_on_setup = true,
  hijack_cursor = false,
  on_attach = function(bufnr)
    local bufmap = function(lhs, rhs, desc)
      vim.keymap.set('n', lhs, rhs, {buffer = bufnr, desc = desc})
    end

    -- See :help nvim-tree.api
    local api = require('nvim-tree.api')
   
    bufmap('gh', api.tree.toggle_hidden_filter, 'Toggle hidden files')
  end
})

vim.keymap.set('n', '<leader>e', '<cmd>NvimTreeToggle<cr>')

-- Telescope
require('telescope').load_extension('fzf')

-- Bufferline
require('bufferline').setup({
  options = {
    mode = 'buffers',
    offsets = {
      {filetype = 'NvimTree'}
    },
  },
  highlights = {
    buffer_selected = {
      italic = false
    },
    indicator_selected = {
      fg = {attribute = 'fg', highlight = 'Function'},
      italic = false
    }
  }
})
