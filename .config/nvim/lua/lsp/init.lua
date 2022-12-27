require 'lspconfig'

local M = {}

local servers = {
	html = {},
	cssls = {},
	tailwindcss = {},
	tsserver = {},

	jsonls = {},
	yamlls = {},
	texlab = {},

	ansiblels = {},

	pyright = {},
	sumneko_lua = {},

}

local function on_attach(client, bufnr)
	-- Enable completion triggered by <C-X><C-O>
	-- See `:help omnifunc` and `:help ins-completion` for more information.
	vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

	-- Use LSP as the handler for formatexpr.
	-- See `:help formatexpr` for more information.
	vim.api.nvim_buf_set_option(0, "formatexpr", "v:lua.vim.lsp.formatexpr()")

	-- Configure key mappings
	require("lsp.keymaps").init(client, bufnr)
end

local opts = {
	on_attach = on_attach,
	flags = {
		debounce_text_changes = 150,
	},
}

function M.init()
	require("lsp.installer").init(servers, opts)
	local cmp = require("lsp.cmp")
	cmp.init()

	local lspconfig = require('lspconfig')
	local lsp_defaults = lspconfig.util.default_config
	cmp.announce(lsp_defaults)
end

return M
