local mode_map = require'utils'.mode_map
local vmap = mode_map 'v'
local nmap = mode_map 'n'
local tmap = mode_map 't'

local function cmd_nmap(keys, cmd) nmap(keys, '<cmd>' .. cmd .. '<cr>') end
local function cmd_vmap(keys, cmd) vmap(keys, '<cmd>' .. cmd .. '<cr>') end
local function term_map(keys, cmd) tmap(keys, '<C-\\><C-n>' .. cmd) end

vim.g.mapleader = ' '

-- remove highlights 
nmap('<esc>', ':noh<return><esc>')

-- keep selects for indents
vmap('<', '<gv')
vmap('>', '>gv')

-- open the terminal
cmd_nmap('<Leader>mm', 'ToggleTerm direction=horizontal')
cmd_nmap('<Leader>mn', 'ToggleTerm direction=float')

-- allow leaving the terminal
term_map('<esc>', '')
term_map('<C-h>', '<C-W>h')
term_map('<C-j>', '<C-W>j')
term_map('<C-k>', '<C-W>k')
term_map('<C-l>', '<C-W>l')

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

