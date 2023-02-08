return require('packer').startup(function()
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'

	use 'mhinz/vim-startify'

	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.0',
		requires = { {'nvim-lua/plenary.nvim'} }
	}
	use { "nvim-telescope/telescope-file-browser.nvim",
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

	use {'nvim-treesitter/nvim-treesitter',
	   config = function()
		  require'nvim-treesitter.configs'.setup {
		  -- If TS highlights are not enabled at all, or disabled via `disable` prop,
		  -- highlighting will fallback to default Vim syntax highlighting
			highlight = {
			   enable = true,
			   additional_vim_regex_highlighting = {'org'}, -- Required for spellcheck, some LaTex highlights and code block highlights that do not have ts grammar
			   },
			ensure_installed = {'org'}, -- Or run :TSUpdate org
			}
	   end
	}

	use 'vimwiki/vimwiki'
	use 'jreybert/vimagit'
	use { 'nvim-lualine/lualine.nvim',
    	requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  	}
	require('lualine').setup()
	use 'vifm/vifm.vim'
	use {
		'nvim-tree/nvim-tree.lua',
		requires = {
    		'nvim-tree/nvim-web-devicons', -- optional, for file icons
  		},
		tag = 'nightly' -- optional, updated every week. (see issue #1193)
	}
	use 'tiagofumo/vim-nerdtree-syntax-highlight'
	use 'ryanoasis/vim-devicons'
	use 'sheerun/vim-polyglot'
	use 'rust-lang/rust.vim'
	use 'tpope/vim-surround'
	use 'PotatoesMaster/i3-vim-syntax'
	use 'kovetskiy/sxhkd-vim'
	use 'vim-python/python-syntax'
	use 'ap/vim-css-color'
	use 'junegunn/goyo.vim'
	use 'junegunn/limelight.vim'
	use 'junegunn/vim-emoji'
	use 'morhetz/gruvbox'
	use 'frazrepo/vim-rainbow'
	use 'rcarriga/nvim-notify'
	use 'airblade/vim-gitgutter'
	use 'itchyny/vim-gitbranch'
	use 'tpope/vim-commentary'
	use 'kyazdani42/nvim-web-devicons'
	use 'farmergreg/vim-lastplace'
	use 'dstein64/vim-startuptime'
	use {'akinsho/bufferline.nvim', tag = "v2.*", requires = 'kyazdani42/nvim-web-devicons'}
	require("bufferline").setup()

	use 'Pocco81/auto-save.nvim'
	require('auto-save').setup {
		enabled = true, -- start auto-save when the plugin is loaded (i.e. when your package manager loads it)
		execution_message = {
			message = function() -- message to print on save
				return ("AutoSave: saved at " .. vim.fn.strftime("%H:%M:%S"))
			end,
			dim = 0.18, -- dim the color of `message`
			cleaning_interval = 1250, -- (milliseconds) automatically clean MsgArea after displaying `message`. See :h MsgArea
		},
		trigger_events = {"InsertLeave", "TextChanged"}, -- vim events that trigger auto-save. See :h events
		-- function that determines whether to save the current buffer or not
		-- return true: if buffer is ok to be saved
		-- return false: if it's not ok to be saved
		condition = function(buf)
			local fn = vim.fn
			local utils = require("auto-save.utils.data")

			if
				fn.getbufvar(buf, "&modifiable") == 1 and
				utils.not_in(fn.getbufvar(buf, "&filetype"), {}) then
				return true -- met condition(s), can save
			end
			return false -- can't save
		end,
		write_all_buffers = false, -- write all buffers when the current one meets `condition`
		debounce_delay = 135, -- saves the file at most every `debounce_delay` milliseconds
		callbacks = { -- functions to be executed at different intervals
			enabling = nil, -- ran when enabling auto-save
			disabling = nil, -- ran when disabling auto-save
			before_asserting_save = nil, -- ran before checking `condition`
			before_saving = nil, -- ran before doing the actual save
			after_saving = nil -- ran after doing the actual save
		}
	}

	use {
		"folke/todo-comments.nvim",
		requires = "nvim-lua/plenary.nvim",
		config = function()
			require("todo-comments").setup {
			  -- your configuration comes here
			  -- or leave it empty to use the default settings
			  -- refer to the configuration section below
			}
		end
	}
	use {
		"windwp/nvim-autopairs",
    	config = function() require("nvim-autopairs").setup {} end
	}
	-- LSP
	use { "williamboman/mason.nvim" }
	use { -- LSP Configuration & Plugins
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

	  use { -- Autocompletion
			'hrsh7th/nvim-cmp',
			requires = { 'hrsh7th/cmp-nvim-lsp', 'L3MON4D3/LuaSnip', 'saadparwaiz1/cmp_luasnip' },
	  }

end)
