-- ┏━┓╋┏┓╋╋╋╋╋╋┏━━━┓╋╋╋╋╋┏━━━┓┏┓╋╋╋╋┏━┓┏━┓
-- ┃┃┗┓┃┃╋╋╋╋╋╋┗┓┏┓┃╋╋╋╋╋┃┏━┓┣┛┗┓╋╋╋┃┏┛┃┏┛
-- ┃┏┓┗┛┣┳━━┳━━┓┃┃┃┣━━┳┓┏┫┗━━╋┓┏╋┓┏┳┛┗┳┛┗┓
-- ┃┃┗┓┃┣┫┏━┫┏┓┃┃┃┃┃┃━┫┗┛┣━━┓┃┃┃┃┃┃┣┓┏┻┓┏┛
-- ┃┃╋┃┃┃┃┗━┫┗┛┣┛┗┛┃┃━╋┓┏┫┗━┛┃┃┗┫┗┛┃┃┃╋┃┃
-- ┗┛╋┗━┻┻━━┻━━┻━━━┻━━┛┗┛┗━━━┛┗━┻━━┛┗┛╋┗┛

-- This is my neovim config rewritten in lua!!

require('plugins')

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
