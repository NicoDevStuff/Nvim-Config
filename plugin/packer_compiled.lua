-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

_G._packer = _G._packer or {}
_G._packer.inside_compile = true

local time
local profile_info
local should_profile = false
if should_profile then
  local hrtime = vim.loop.hrtime
  profile_info = {}
  time = function(chunk, start)
    if start then
      profile_info[chunk] = hrtime()
    else
      profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
    end
  end
else
  time = function(chunk, start) end
end

local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end
  if threshold then
    table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
  end

  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/nico/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/nico/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/nico/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/nico/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/nico/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["bufferline.nvim"] = {
    loaded = true,
    path = "/home/nico/.local/share/nvim/site/pack/packer/start/bufferline.nvim",
    url = "https://github.com/akinsho/bufferline.nvim"
  },
  ["coc.nvim"] = {
    loaded = true,
    path = "/home/nico/.local/share/nvim/site/pack/packer/start/coc.nvim",
    url = "https://github.com/neoclide/coc.nvim"
  },
  ["dashboard-nvim"] = {
    loaded = true,
    path = "/home/nico/.local/share/nvim/site/pack/packer/start/dashboard-nvim",
    url = "https://github.com/glepnir/dashboard-nvim"
  },
  ["goyo.vim"] = {
    loaded = true,
    path = "/home/nico/.local/share/nvim/site/pack/packer/start/goyo.vim",
    url = "https://github.com/junegunn/goyo.vim"
  },
  gruvbox = {
    loaded = true,
    path = "/home/nico/.local/share/nvim/site/pack/packer/start/gruvbox",
    url = "https://github.com/morhetz/gruvbox"
  },
  ["i3-vim-syntax"] = {
    loaded = true,
    path = "/home/nico/.local/share/nvim/site/pack/packer/start/i3-vim-syntax",
    url = "https://github.com/PotatoesMaster/i3-vim-syntax"
  },
  ["limelight.vim"] = {
    loaded = true,
    path = "/home/nico/.local/share/nvim/site/pack/packer/start/limelight.vim",
    url = "https://github.com/junegunn/limelight.vim"
  },
  ["lualine.nvim"] = {
    loaded = true,
    path = "/home/nico/.local/share/nvim/site/pack/packer/start/lualine.nvim",
    url = "https://github.com/nvim-lualine/lualine.nvim"
  },
  ["nord-vim"] = {
    loaded = true,
    path = "/home/nico/.local/share/nvim/site/pack/packer/start/nord-vim",
    url = "https://github.com/arcticicestudio/nord-vim"
  },
  ["nvim-base16"] = {
    loaded = true,
    path = "/home/nico/.local/share/nvim/site/pack/packer/start/nvim-base16",
    url = "https://github.com/RRethy/nvim-base16"
  },
  ["nvim-notify"] = {
    loaded = true,
    path = "/home/nico/.local/share/nvim/site/pack/packer/start/nvim-notify",
    url = "https://github.com/rcarriga/nvim-notify"
  },
  ["nvim-palenight.lua"] = {
    loaded = true,
    path = "/home/nico/.local/share/nvim/site/pack/packer/start/nvim-palenight.lua",
    url = "https://github.com/kyazdani42/nvim-palenight.lua"
  },
  ["nvim-tree.lua"] = {
    loaded = true,
    path = "/home/nico/.local/share/nvim/site/pack/packer/start/nvim-tree.lua",
    url = "https://github.com/nvim-tree/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\2\n¼\1\0\0\5\0\n\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\3\0005\4\4\0=\4\5\3=\3\a\0025\3\b\0=\3\t\2B\0\2\1K\0\1\0\21ensure_installed\1\2\0\0\borg\14highlight\1\0\0&additional_vim_regex_highlighting\1\2\0\0\borg\1\0\1\venable\2\nsetup\28nvim-treesitter.configs\frequire\0" },
    loaded = true,
    path = "/home/nico/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/nico/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/nico/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/nico/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["python-syntax"] = {
    loaded = true,
    path = "/home/nico/.local/share/nvim/site/pack/packer/start/python-syntax",
    url = "https://github.com/vim-python/python-syntax"
  },
  ["sxhkd-vim"] = {
    loaded = true,
    path = "/home/nico/.local/share/nvim/site/pack/packer/start/sxhkd-vim",
    url = "https://github.com/kovetskiy/sxhkd-vim"
  },
  ["telescope-file-browser.nvim"] = {
    config = { "\27LJ\2\nˆ\1\0\0\5\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\4\0005\4\3\0=\4\5\3=\3\a\2B\0\2\1K\0\1\0\15extensions\1\0\0\17file_browser\1\0\0\1\0\2\17hijack_netrw\2\ntheme\fgruvbox\nsetup\14telescope\frequire\0" },
    loaded = true,
    path = "/home/nico/.local/share/nvim/site/pack/packer/start/telescope-file-browser.nvim",
    url = "https://github.com/nvim-telescope/telescope-file-browser.nvim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/home/nico/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["tokyonight-vim"] = {
    loaded = true,
    path = "/home/nico/.local/share/nvim/site/pack/packer/start/tokyonight-vim",
    url = "https://github.com/ghifarit53/tokyonight-vim"
  },
  ["vifm.vim"] = {
    loaded = true,
    path = "/home/nico/.local/share/nvim/site/pack/packer/start/vifm.vim",
    url = "https://github.com/vifm/vifm.vim"
  },
  ["vim-commentary"] = {
    loaded = true,
    path = "/home/nico/.local/share/nvim/site/pack/packer/start/vim-commentary",
    url = "https://github.com/tpope/vim-commentary"
  },
  ["vim-css-color"] = {
    loaded = true,
    path = "/home/nico/.local/share/nvim/site/pack/packer/start/vim-css-color",
    url = "https://github.com/ap/vim-css-color"
  },
  ["vim-devicons"] = {
    loaded = true,
    path = "/home/nico/.local/share/nvim/site/pack/packer/start/vim-devicons",
    url = "https://github.com/ryanoasis/vim-devicons"
  },
  ["vim-emoji"] = {
    loaded = true,
    path = "/home/nico/.local/share/nvim/site/pack/packer/start/vim-emoji",
    url = "https://github.com/junegunn/vim-emoji"
  },
  ["vim-gitbranch"] = {
    loaded = true,
    path = "/home/nico/.local/share/nvim/site/pack/packer/start/vim-gitbranch",
    url = "https://github.com/itchyny/vim-gitbranch"
  },
  ["vim-gitgutter"] = {
    loaded = true,
    path = "/home/nico/.local/share/nvim/site/pack/packer/start/vim-gitgutter",
    url = "https://github.com/airblade/vim-gitgutter"
  },
  ["vim-lastplace"] = {
    loaded = true,
    path = "/home/nico/.local/share/nvim/site/pack/packer/start/vim-lastplace",
    url = "https://github.com/farmergreg/vim-lastplace"
  },
  ["vim-nerdtree-syntax-highlight"] = {
    loaded = true,
    path = "/home/nico/.local/share/nvim/site/pack/packer/start/vim-nerdtree-syntax-highlight",
    url = "https://github.com/tiagofumo/vim-nerdtree-syntax-highlight"
  },
  ["vim-rainbow"] = {
    loaded = true,
    path = "/home/nico/.local/share/nvim/site/pack/packer/start/vim-rainbow",
    url = "https://github.com/frazrepo/vim-rainbow"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "/home/nico/.local/share/nvim/site/pack/packer/start/vim-surround",
    url = "https://github.com/tpope/vim-surround"
  },
  vimagit = {
    loaded = true,
    path = "/home/nico/.local/share/nvim/site/pack/packer/start/vimagit",
    url = "https://github.com/jreybert/vimagit"
  },
  vimwiki = {
    loaded = true,
    path = "/home/nico/.local/share/nvim/site/pack/packer/start/vimwiki",
    url = "https://github.com/vimwiki/vimwiki"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\2\n¼\1\0\0\5\0\n\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\3\0005\4\4\0=\4\5\3=\3\a\0025\3\b\0=\3\t\2B\0\2\1K\0\1\0\21ensure_installed\1\2\0\0\borg\14highlight\1\0\0&additional_vim_regex_highlighting\1\2\0\0\borg\1\0\1\venable\2\nsetup\28nvim-treesitter.configs\frequire\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: telescope-file-browser.nvim
time([[Config for telescope-file-browser.nvim]], true)
try_loadstring("\27LJ\2\nˆ\1\0\0\5\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\4\0005\4\3\0=\4\5\3=\3\a\2B\0\2\1K\0\1\0\15extensions\1\0\0\17file_browser\1\0\0\1\0\2\17hijack_netrw\2\ntheme\fgruvbox\nsetup\14telescope\frequire\0", "config", "telescope-file-browser.nvim")
time([[Config for telescope-file-browser.nvim]], false)

_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
