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

--Lua:
-- set colorscheme
vim.cmd([[
	let g:gruvbox_material_background = 'medium'
    let g:gruvbox_material_better_performance = 1
	colorscheme gruvbox-material
]])

g.mapleader = ' '

-- plugin configuration
-- nvim-tree
require("nvim-tree").setup {
	auto_reload_on_write = true,
	create_in_closed_folder = false,

	diagnostics = {
		enable = true,
	},

}

local tabnine = require('cmp_tabnine.config')

tabnine:setup({
	max_lines = 1000,
	max_num_results = 20,
	sort = true,
	run_on_every_keystroke = true,
	snippet_placeholder = '🚀',
	ignored_file_types = {
		-- default is not to ignore
		-- uncomment to ignore in lua:
		-- lua = true
	},
	show_prediction_strength = false
})

-- notify
vim.notify = require("notify")

local function notify(msg, title)
	vim.notify(msg, nil, {
		title = title,
		render = "simple",
		stages = "fade",
	})
end
