local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
		vim.cmd [[packadd packer.nvim]]
		return true
	end
	return false
end

local install = function()
	local packer_bootstrap = ensure_packer()

	require('packer').startup(function(use)
		use 'wbthomason/packer.nvim'
		use 'ellisonleao/gruvbox.nvim' -- Color theme
		use 'nvim-lualine/lualine.nvim'
		use 'lukas-reineke/indent-blankline.nvim' -- For having vertical lines on indents
		use 'andweeb/presence.nvim' -- For intergrating with discord 'now playing' rich presence
		use {
			'nvim-treesitter/nvim-treesitter',
			run = function()
				local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
				ts_update()
			end,
		}
		use { 'nvim-tree/nvim-tree.lua', requires = {
				'nvim-tree/nvim-web-devicons', -- optional, for file icons
			}
		} -- For file explorer

		-- For Telescope
		use 'nvim-lua/plenary.nvim'
		use 'nvim-telescope/telescope.nvim'
		use {'nvim-telescope/telescope-fzf-native.nvim',
			run = 'make'
		}

		use {'akinsho/bufferline.nvim', requires = {'nvim-tree/nvim-web-devicons', 'moll/vim-bbye'} }

		use { 'neovim/nvim-lspconfig', requires = 'williamboman/nvim-lsp-installer', }


		-- For autocompletition
		use 'hrsh7th/cmp-nvim-lsp'
		use 'hrsh7th/cmp-buffer'
		use 'hrsh7th/cmp-path'
		use 'hrsh7th/cmp-cmdline'
		use 'hrsh7th/nvim-cmp'

		-- For snippets and related autocompletition
		use 'L3MON4D3/LuaSnip'
		use 'saadparwaiz1/cmp_luasnip'
		use 'rafamadriz/friendly-snippets'

		use 'rcarriga/nvim-notify'

		use { "folke/which-key.nvim", config = function()
				require("which-key").setup {}
			end
		}

		-- use { 'rmagatti/goto-preview', config = function()
		-- 		require('goto-preview').setup {default_mappings = true}
		-- 	end
		-- }

		-- Automatically set up your configuration after cloning packer.nvim
		-- Put this at the end after all plugins
		if packer_bootstrap then
			require('packer').sync()
		end
	end)
end

return install
