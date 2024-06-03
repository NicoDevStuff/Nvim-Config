vim.cmd([[
  augroup setup_user_config
    autocmd!
    autocmd BufWritePost setup.lua source <afile>
  augroup end
]])

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
o.encoding = "UTF-8"
o.visualbell = true
o.updatetime = 300
opt.termguicolors = true
o.showmode = false
o.compatible = false
o.clipboard = 'unnamedplus'
o.splitright = true
o.splitbelow = true
o.foldenable = false
-- o.nowrap = true
--
require("plugins.cokeline")

-- Gruvbox
vim.cmd([[
	set background=dark
	let g:gruvbox_material_background = 'medium'
    let g:gruvbox_material_better_performance = 1
	colorscheme gruvbox-material
]])

vim.cmd([[
	set nowrap
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

require("plugins.lualine")

require("telescope").setup {
	extensions = {
		file_browser = {
			theme = "gruvbox",
			-- disables netrw and use telescope-file-browser in its place
			hijack_netrw = true,
		},
	},
}
require("telescope").load_extension "file_browser"


-- notify
vim.notify = require("notify")

local function notify(msg, title)
	vim.notify(msg, nil, {
		title = title,
		render = "simple",
		stages = "fade",
	})
end
