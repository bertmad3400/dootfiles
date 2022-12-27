local M = {}

function M.init()
	vim.opt.completeopt = {'menu', 'menuone', 'noselect'}

	local cmp = require('cmp')
	local luasnip = require('luasnip')

	local select_opts = {behavior = cmp.SelectBehavior.Select}

	cmp.setup({
		snippet = {
		expand = function(args)
				luasnip.lsp_expand(args.body)
			end
		},
		sources = {
			{name = 'path'},
			{name = 'nvim_lsp', keyword_length = 3},
			{name = 'buffer', keyword_length = 3},
			{name = 'luasnip', keyword_length = 2},
		},
		window = {
			documentation = cmp.config.window.bordered()
		},
		formatting = {
			fields = {'menu', 'abbr', 'kind'},
			format = function(entry, item)
				local menu_icon = {
				nvim_lsp = 'λ',
				luasnip = '⋗',
				buffer = 'Ω',
				path = '🖫',
				}

				item.menu = menu_icon[entry.source.name]
				return item
			end,
		},
		mapping = {
		-- Move between completion items.
		['<Up>'] = cmp.mapping.select_prev_item(select_opts),
		['<Down>'] = cmp.mapping.select_next_item(select_opts),

		['<C-p>'] = cmp.mapping.select_prev_item(select_opts),
		['<C-n>'] = cmp.mapping.select_next_item(select_opts),

		-- Scroll text in the documentation window.
		['<C-u>'] = cmp.mapping.scroll_docs(-4),
		['<C-f>'] = cmp.mapping.scroll_docs(4),

		['<C-e>'] = cmp.mapping.abort(), -- Cancel completion.
		['<CR>'] = cmp.mapping.confirm({select = false}), -- Confirm selection.

		-- Jump to the next placeholder in the snippet
		['<C-d>'] = cmp.mapping(function(fallback)
			if luasnip.jumpable(1) then
				luasnip.jump(1)
			else
				fallback()
			end
		end, {'i', 's'}),

		-- Jump to the previous placeholder in the snippet
		['<C-b>'] = cmp.mapping(function(fallback)
			if luasnip.jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end, {'i', 's'}),

		-- If:
		-- Line is empty: Insert tab
		-- Completition is already active: Move to next item
		-- Else: Trigger completition
		['<Tab>'] = cmp.mapping(function(fallback)
			local col = vim.fn.col('.') - 1

			if cmp.visible() then
				cmp.select_next_item(select_opts)
			elseif col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
				fallback()
			else
				cmp.complete()
			end
		end, {'i', 's'}),

		-- If the completion menu is visible, move to the previous item.
		['<S-Tab>'] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item(select_opts)
			else
				fallback()
			end
		end, {'i', 's'}),
		},
	})
end

function M.announce(config)
	config.capabilities = vim.tbl_deep_extend(
	  'force',
	  config.capabilities,
	  require('cmp_nvim_lsp').default_capabilities()
	)
end

return M
