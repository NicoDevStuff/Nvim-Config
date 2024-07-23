local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

return require('packer').startup(function()
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'

	-- start page
	use {
        'goolord/alpha-nvim',
        config = function() require('plugins.alpha') end,
    }

	-- file stuff
	use {
		'nvim-telescope/telescope.nvim',
		requires = { {'nvim-lua/plenary.nvim'},
					{ 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' },}
	}

	use {
		"nvim-telescope/telescope-file-browser.nvim",
	}

	use {
		'nvim-tree/nvim-tree.lua',
		requires = {
    		'nvim-tree/nvim-web-devicons', -- optional, for file icons
  		},
		tag = 'nightly' -- optional, updated every week. (see issue #1193)
	}

	-- lsp and syntax
	use {
		"williamboman/mason.nvim"
	}

	use {
		"j-hui/fidget.nvim",
		tag = "legacy"
	}

	use {
		'neovim/nvim-lspconfig',
		requires = {
		  -- Automatically install LSPs to stdpath for neovim
		  'williamboman/mason.nvim',
		  'williamboman/mason-lspconfig.nvim',

		  -- Useful status updates for LSP
		  'j-hui/fidget.nvim',

		  -- Additional lua configuration, makes nvim stuff amazing
		  'folke/neodev.nvim',
		},
	}

	use {
		'hrsh7th/nvim-cmp',
		requires = {
			'hrsh7th/cmp-nvim-lsp',
			'L3MON4D3/LuaSnip',
			'saadparwaiz1/cmp_luasnip'
		},
	}

	use {
		'nvim-treesitter/nvim-treesitter',
		config = function()
		require'nvim-treesitter.configs'.setup {
			-- If TS highlights are not enabled at all, or disabled via `disable` prop,
			-- highlighting will fallback to default Vim syntax highlighting
			highlight = {
				enable = true,
			},
			ensure_installed = {
				'c',
				'lua',
			},
		}
		end
	}

	use 'alaviss/nim.nvim'
	use {
		'RaafatTurki/hex.nvim',
		startup = function ()
			require 'hex'.setup()
		end
	}
	--
	-- git
	use 'jreybert/vimagit'
	use 'airblade/vim-gitgutter'
	use 'itchyny/vim-gitbranch'

	-- cmake
	use {"akinsho/toggleterm.nvim", tag = '*', config = function()
		require("toggleterm").setup()
	end}

	use {
		'Civitasv/cmake-tools.nvim',
		requires = {
			'nvim-lua/plenary.nvim',
			'mfussenegger/nvim-dap',
		},
		config = function () require("plugins.cmake") end
	}

	use 'igankevich/mesonic'

	-- themes and other style stuff
	use 'morhetz/gruvbox'
	use 'sainnhe/gruvbox-material'
	use 'RRethy/base16-nvim'

	use 'ap/vim-css-color'
	use 'kyazdani42/nvim-web-devicons'
	use 'ryanoasis/vim-devicons'
	use 'junegunn/vim-emoji'

	use 'rcarriga/nvim-notify'

	-- bars
	use { 
		'nvim-lualine/lualine.nvim',
    	requires = {
			'kyazdani42/nvim-web-devicons',
			opt = true
		}
  	}


	use {
		"willothy/nvim-cokeline",
	  	requires = {
			"nvim-lua/plenary.nvim",        -- Required for v0.4.0+
			"nvim-tree/nvim-web-devicons", -- If you want devicons
			"stevearc/resession.nvim"       -- Optional, for persistent history
		},
	}


	-- quality of life features
	use 'tpope/vim-commentary'
	use 'farmergreg/vim-lastplace'

	use {
		"folke/todo-comments.nvim",
		requires = "nvim-lua/plenary.nvim",
		config = function()
			require("todo-comments").setup {
			}
		end
	}

	use {
		"windwp/nvim-autopairs",
    	config = function() require("nvim-autopairs").setup {} end
	}

	use({
	  "aurum77/live-server.nvim",
		run = function()
		  require"live_server.util".install()
		end,
		cmd = { "LiveServer", "LiveServerStart", "LiveServerStop" },
	  })

	use 'baskerville/vim-sxhkdrc'
	if packer_bootstrap then
		require('packer').sync()
	end
end)
