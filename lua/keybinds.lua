local function map(m, k, v)
   vim.keymap.set(m, k, v, { silent = true })
end

local builtin = require('telescope.builtin')
map('n', '<leader>ff', builtin.find_files)
map('n', '<leader>fb' , builtin.buffers)
map('n', '<leader>fd' , '<CMD>NvimTreeOpen<CR>')

-- no more arrow keys for you
map('n', '<Left>', '')
map('n', '<Right>', '')
map('n', '<Up>', '')
map('n', '<Down>', '')
map('i', '<Left>', '')
map('i', '<Right>', '')
map('i', '<Up>', '')
map('i', '<Down>', '')
map('v', '<Left>', '')
map('v', '<Right>', '')
map('v', '<Up>', '')
map('v', '<Down>', '')

-- bufferline
map('n', '<Left>',   '<Plug>(cokeline-focus-prev)',  { silent = true })
map('n', '<Right>',     '<Plug>(cokeline-focus-next)',  { silent = true })
map('n', '<Down>', '<Plug>(cokeline-switch-prev)', { silent = true })
map('n', '<Up>', '<Plug>(cokeline-switch-next)', { silent = true })


-- cmake 
map('n', '<C-d>', '<cmd> CMake build_and_run <CR>')
map('n', '<C-f>', '<cmd> CMake select_target <CR>')

-- set normal mode in every window(also the terminal)
vim.cmd([[
	tnoremap <Esc> <C-\><C-n>:stopinsert<CR>
]])


map('n', '#', '')

-- terminal
map('n', '<leader>tt', '<cmd> terminal <CR>')

vim.cmd([[
	function! WinMove(key)
		let t:curwin = winnr()
		exec "wincmd ".a:key
		if (t:curwin == winnr())
			if (match(a:key,'[jk]'))
				wincmd v
			else
				wincmd s
			endif
			exec "wincmd ".a:key
		endif
	endfunction

	nnoremap <silent> <C-h> :call WinMove('h') <CR>
	nnoremap <silent> <C-j> :call WinMove('j') <CR>
	nnoremap <silent> <C-k> :call WinMove('k') <CR>
	nnoremap <silent> <C-l> :call WinMove('l') <CR>
]])

