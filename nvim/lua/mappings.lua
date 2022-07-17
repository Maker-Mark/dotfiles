local mode_map = require'utils'.mode_map
local vmap = mode_map 'v'
local nmap = mode_map 'n'
local tmap = mode_map 't'

local function cmd_nmap(keys, cmd) nmap(keys, '<cmd>' .. cmd .. '<cr>') end
local function cmd_vmap(keys, cmd) vmap(keys, '<cmd>' .. cmd .. '<cr>') end

vim.g.mapleader = ' '

-- keep selects for indents
vmap('<', '<gv')
vmap('>', '>gv')

-- leave terminal
tmap('<M-k>', '<C-\\><C-n> <C-w>k')

-- barbar / file tabs
cmd_nmap('f', 'BufferLinePick')
cmd_nmap('F', 'BufferLinePickClose')
cmd_nmap('<TAB>', 'BufferLineCycleNext')
cmd_nmap('<S-TAB>', 'BufferLineCyclePrev')

-- toggle file tree
cmd_nmap('<Leader>e', 'NvimTreeToggle')

-- prettify
cmd_nmap('<Leader>p', 'Neoformat')

-- telescope
cmd_nmap('<Leader>f', 'Telescope live_grep')
cmd_nmap('<Leader>r', 'Telescope find_files')

-- comment
cmd_nmap('<Leader>c', 'CommentToggle')
cmd_vmap('<Leader>c', '\'<,\'>CommentToggle')

