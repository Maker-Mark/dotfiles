local mode_map = require'utils'.mode_map
local vmap = mode_map 'v'
local nmap = mode_map 'n'
local tmap = mode_map 't'

local function cmdmap(keys, cmd) nmap(keys, '<cmd>' .. cmd .. '<cr>') end

-- keep selects for indents
vmap('<', '<gv')
vmap('>', '>gv')

-- leave terminal
tmap('<M-k>', '<C-\\><C-n> <C-w>k')

vim.g.mapleader = ' '

-- barbar / file tabs
cmdmap('f', 'BufferLinePick')
cmdmap('F', 'BufferLinePickClose')
cmdmap('<TAB>', 'BufferLineCycleNext')
cmdmap('<S-TAB>', 'BufferLineCyclePrev')

-- toggle file tree
cmdmap('<Leader>e', 'NvimTreeToggle')

-- prettify
cmdmap('<Leader>p', 'Neoformat')

-- telescope
cmdmap('<Leader>f', 'Telescope live_grep')
cmdmap('<Leader>r', 'Telescope find_files')
