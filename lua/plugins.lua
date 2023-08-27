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
	--
	-- file stuff
	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.0',
		requires = { {'nvim-lua/plenary.nvim'} }
	}

	use {
		"nvim-telescope/telescope-file-browser.nvim",
		config = function()
		require("telescope").setup {
		  extensions = {
			file_browser = {
			  theme = "gruvbox",
			  -- disables netrw and use telescope-file-browser in its place
			  hijack_netrw = true,
			},
		  },
		}
		end
	}
	require("telescope").load_extension "file_browser"

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
				'zig'
			},
		}
		end
	}

	use 'alaviss/nim.nvim'
	use 'RaafatTurki/hex.nvim'
	require 'hex'.setup()
	--
	-- git
	use 'jreybert/vimagit'
	use 'airblade/vim-gitgutter'
	use 'itchyny/vim-gitbranch'

	-- cmake
	use {
		'Civitasv/cmake-tools.nvim',
		requires = {
			'nvim-lua/plenary.nvim',
			'mfussenegger/nvim-dap'
		}
	}
	-- themes and other style stuff
	use 'morhetz/gruvbox'
	use 'sainnhe/gruvbox-material'
	use 'sainnhe/everforest'
	use 'catppuccin/nvim'
	use 'joshdick/onedark.vim'

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
	require('lualine').setup()
	use {
		'akinsho/bufferline.nvim',
		tag = "v2.*",
		requires = 'kyazdani42/nvim-web-devicons'
	}
	require("bufferline").setup()
	--

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

	use 'baskerville/vim-sxhkdrc'
	if packer_bootstrap then
		require('packer').sync()
	end
end)
