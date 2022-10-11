-- ┏━┓╋┏┓╋╋╋╋╋╋┏━━━┓╋╋╋╋╋┏━━━┓┏┓╋╋╋╋┏━┓┏━┓
-- ┃┃┗┓┃┃╋╋╋╋╋╋┗┓┏┓┃╋╋╋╋╋┃┏━┓┣┛┗┓╋╋╋┃┏┛┃┏┛
-- ┃┏┓┗┛┣┳━━┳━━┓┃┃┃┣━━┳┓┏┫┗━━╋┓┏╋┓┏┳┛┗┳┛┗┓
-- ┃┃┗┓┃┣┫┏━┫┏┓┃┃┃┃┃┃━┫┗┛┣━━┓┃┃┃┃┃┃┣┓┏┻┓┏┛
-- ┃┃╋┃┃┃┃┗━┫┗┛┣┛┗┛┃┃━╋┓┏┫┗━┛┃┃┗┫┗┛┃┃┃╋┃┃
-- ┗┛╋┗━┻┻━━┻━━┻━━━┻━━┛┗┛┗━━━┛┗━┻━━┛┗┛╋┗┛

-- This is my neovim config rewritten in lua!! 
-- [Links] -> https://gitlab.com/dwt1/dotfiles/-/blob/master/.config/nvim/init.lua 

local g   = vim.g
local o   = vim.o
local opt = vim.opt
local A   = vim.api

-- base config
o.number = true
o.ruler = true
o.mouse = "a"
o.tabstop = 4
o.shiftwidth = 4
o.smarttab = true
o.autoindent = true
o.smartindent = true
o.wrap = false
o.encoding = "UTF-8"
o.visualbell = true
o.updatetime = 300
opt.termguicolors = true
o.showmode = false
o.compatible = false
o.clipboard = 'unnamedplus'
o.splitright = true
o.splitbelow = true

-- set colorscheme
vim.cmd([[colorscheme gruvbox]])

g.mapleader = ' '
--------------------

-- keybindings

local function map(m, k, v)
   vim.keymap.set(m, k, v, { silent = true })
end

local builtin = require('telescope.builtin')

map('n', '<leader>fb', builtin.find_files)
map('n', '<leader>ff' , '<CMD>NvimTreeOpen<CR>')

-- vim bufferline scroll through the tabs
map('n', 'm', '<cmd> BufferLineCycleNext <CR>')
map('n', 'n', '<cmd> BufferLineCyclePrev <CR>')
map('n', '<leader>m', '<cmd> BufferLineMoveNext <CR>')
map('n', '<leader>n', '<cmd> BufferLineMovePrev <CR>')

-- terminal
map('n', '<leader>tt', '<cmd> terminal <CR>')

vim.cmd([[
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
							  ]])

vim.cmd([[autocmd CursorHold * silent call CocActionAsync('highlight')]])

vim.cmd([[inoremap <silent><expr> <c-space> coc#refresh()]])
--------------------
-- plugin configuration

-- dashboard
local db = require('dashboard')
local home = os.getenv('HOME')

function script_path()
   local str = debug.getinfo(2, "S").source:sub(2)
   return str:match("(.*/)")
end

db.default_banner = {
	'',
	'',
  	'  ▄▄    ▄ ▄▄▄▄▄▄▄ ▄▄▄▄▄▄▄ ▄▄   ▄▄ ▄▄▄ ▄▄   ▄▄ ',
 	' █  █  █ █       █       █  █ █  █   █  █▄█  █',
 	' █   █▄█ █    ▄▄▄█   ▄   █  █▄█  █   █       █',
 	' █       █   █▄▄▄█  █ █  █       █   █       █',
 	' █  ▄    █    ▄▄▄█  █▄█  █       █   █       █',
 	' █ █ █   █   █▄▄▄█       ██     ██   █ ██▄██ █',
 	' █▄█  █▄▄█▄▄▄▄▄▄▄█▄▄▄▄▄▄▄█ █▄▄▄█ █▄▄▄█▄█   █▄█',
  	'',
  	'',
}

db.preview_file_height = 11
db.preview_file_width = 70
db.custom_center = {
	{icon = '  ',
	desc = 'Recent sessions                         ',
	shortcut = 'SPC s l',
	action ='SessionLoad'},
	{icon = '  ',
	desc = 'Find recent files                       ',
	action = 'Telescope oldfiles',
	shortcut = 'SPC f r'},
	{icon = '  ',
	desc = 'Find files                              ',
	action = 'Telescope find_files find_command=rg,--hidden,--files',
	shortcut = 'SPC f f'},
	{icon = '  ',
	desc ='File browser                            ',
	action =  'Telescope file_browser',
	shortcut = 'SPC f b'},

	{icon = '  ',
	desc = 'Find word                               ',
	action = 'Telescope live_grep',
	shortcut = 'SPC f w'},
	{icon = '  ',
	desc = 'Load new theme                          ',
	action = 'Telescope colorscheme',
	shortcut = 'SPC h t'},
}

db.session_directory = "/home/nico/.config/nvim/session"
db.custom_footer = { 'Path:', script_path() }

-- coc.nvim
g.coc_global_extensions = { 
  'coc-snippets',
  'coc-pairs',
  'coc-eslint',
  'coc-prettier',
  'coc-json',
} 

-- nvim-tree
require("nvim-tree").setup {
	auto_reload_on_write = true,
	create_in_closed_folder = false,

	diagnostics = {
		enable = true,
	},

}


-- notify
vim.notify = require("notify")

function notify(msg, title)
	vim.notify(msg, nil, {
		title = title,
		render = "simple",
		stages = "fade",
	})
end

return require('packer').startup(function()
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'

	-- Dashboard is a nice start screen for nvim
	use 'glepnir/dashboard-nvim'

	-- Telescope and related plugins --
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

	-- To get telescope-file-browser loaded and working with telescope,
	-- you need to call load_extension, somewhere after setup function:
	require("telescope").load_extension "file_browser"

	-- Treesitter --
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
	

	-- Productivity --
	use 'vimwiki/vimwiki'
	use 'jreybert/vimagit'
	
	 -- A better status line --
	use { 'nvim-lualine/lualine.nvim',
    	requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  	}
	require('lualine').setup()
	
	-- File management --
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
	
	-- language server
	use 'neoclide/coc.nvim'
	use 'sheerun/vim-polyglot'
	use 'rust-lang/rust.vim'
	-- Tim Pope Plugins --
	use 'tpope/vim-surround'

	-- Syntax Highlighting and Colors --
	use 'PotatoesMaster/i3-vim-syntax'
	use 'kovetskiy/sxhkd-vim'
	use 'vim-python/python-syntax'
	use 'ap/vim-css-color'

	-- Junegunn Choi Plugins --
	use 'junegunn/goyo.vim'
	use 'junegunn/limelight.vim'
	use 'junegunn/vim-emoji'

	-- Colorschemes --
	use 'RRethy/nvim-base16'
	use 'kyazdani42/nvim-palenight.lua'
	use 'morhetz/gruvbox'
	use 'arcticicestudio/nord-vim'
	use 'ghifarit53/tokyonight-vim'

	-- Other stuff --
	use 'frazrepo/vim-rainbow'
	use 'rcarriga/nvim-notify'

	use 'airblade/vim-gitgutter'
	use 'itchyny/vim-gitbranch'

	use 'tpope/vim-commentary'

	use 'kyazdani42/nvim-web-devicons'
	
	use 'farmergreg/vim-lastplace'

	use 'dstein64/vim-startuptime'

	-- bufferline --
	use {'akinsho/bufferline.nvim', tag = "v2.*", requires = 'kyazdani42/nvim-web-devicons'}
	require("bufferline").setup()

	use {
		"AmeerTaweel/todo.nvim",
		requires = "nvim-lua/plenary.nvim",
		config = function()
			require("todo").setup {
				-- your configuration comes here
				-- or leave it empty to use the default settings
				-- refer to the configuration section below
			}
		end
	}

end)
