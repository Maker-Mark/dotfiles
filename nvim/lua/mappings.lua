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
cmd_nmap('<Leader>ma', 'ToggleTermToggleAll')

-- allow leaving the terminal
term_map('<esc>', '')
term_map('<C-h>', '<C-W>h')
term_map('<C-j>', '<C-W>j')
term_map('<C-k>', '<C-W>k')
term_map('<C-l>', '<C-W>l')

-- bufferline / file tabs
cmd_nmap('<TAB>', 'BufferLineCycleNext')
cmd_nmap('<S-TAB>', 'BufferLineCyclePrev')
cmd_nmap('<Leader>w', 'BufDel')
cmd_nmap('<Leader>W', 'BufDel!')

-- toggle file tree
cmd_nmap('<Leader>e', 'NvimTreeToggle')

-- prettify
cmd_nmap('<Leader>p', 'Neoformat')

-- trouble
cmd_nmap('<Leader>to', 'Trouble')
cmd_nmap('<Leader>tc', 'TroubleClose')

-- telescope
cmd_nmap('<Leader>ff', 'Telescope find_files')
cmd_nmap('<Leader>fg', 'Telescope live_grep')
cmd_nmap('<Leader>fs', 'Telescope git_status')
cmd_nmap('<Leader>fd', 'Telescope diagnostics')
cmd_nmap('<Leader>fc', 'Telescope command_history')

-- info on key bindings
cmd_nmap('?', 'WhichKey')

-- lazygit
local Terminal = require('toggleterm.terminal').Terminal
local lazygit = Terminal:new({ cmd = "lazygit", hidden = true, direction = "float" })

function _LAZYGIT_TOGGLE() lazygit:toggle() end
cmd_nmap('<Leader>l', 'lua _LAZYGIT_TOGGLE()')
