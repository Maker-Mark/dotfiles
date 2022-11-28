local function nmap(keys, func)
    vim.keymap.set('n', keys, func, { buffer = 0 })
end

local capabilities = vim.lsp.protocol.make_client_capabilities()

local function on_attach()
    nmap('K', vim.lsp.buf.hover)
    nmap('gd', vim.lsp.buf.definition)
    nmap('gt', vim.lsp.buf.type_definition)
    nmap('<leader>r', vim.lsp.buf.rename)

    nmap('<leader>dj', vim.diagnostic.goto_next)
    nmap('<leader>dk', vim.diagnostic.goto_prev)
end

local lsp_config = require'lspconfig'

local function setup_lsp(server, props)
    local setup_table = { capabilities = capabilities, on_attach = on_attach }
    for key, val in pairs(props or {}) do
	setup_table[key] = val
    end
    lsp_config[server].setup(setup_table)
end

setup_lsp('rust_analyzer', {
    ['rust-analyzer'] = {
	checkonsave = { command = 'clippy' },
    },
})

setup_lsp('sumneko_lua', {
    settings = {
	Lua = {
	    runtime = {
		version = 'LuaJIT',
		path = vim.split(package.path, ';'),
	    },
	    diagnostics = {
		globals = { 'vim' }
	    },
	    workspace = {
		library = {
		    [vim.fn.expand('$VIMRUNTIME/lua')] = true,
		    [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
		}
	    },
	},
    }
})

setup_lsp 'svelte'
setup_lsp 'tsserver'
setup_lsp 'eslint'
setup_lsp 'astro'

lsp_config.svelte.setup {
    capabilities = capabilities,
    on_attach = on_attach,
}

vim.opt.completeopt = {'menu', 'menuone', 'noselect'}

local cmp = require'cmp'
cmp.setup({
    snippet = {
		expand = function(args) require'luasnip'.lsp_expand(args.body) end
	},
    mapping = {
	['<C-p>'] = cmp.mapping.select_prev_item(),
	['<C-n>'] = cmp.mapping.select_next_item(),
	-- Add tab support
	['<S-Tab>'] = cmp.mapping.select_prev_item(),
	['<Tab>'] = cmp.mapping.select_next_item(),
	['<C-d>'] = cmp.mapping.scroll_docs(-4),
	['<C-f>'] = cmp.mapping.scroll_docs(4),
	['<C-Space>'] = cmp.mapping.complete(),
	['<C-e>'] = cmp.mapping.close(),
	['<CR>'] = cmp.mapping.confirm({
	    behavior = cmp.ConfirmBehavior.Insert,
	    select = true,
	})
    },

    -- Installed sources
    sources = {
	{ name = 'nvim_lsp' },
	{ name = 'vsnip' },
	{ name = 'path' },
	{ name = 'buffer' },
    },

    formatting = {
	format = require'lspkind'.cmp_format({
	    mode = 'symbol',
	    maxwidth = 50,
	})
    }
})

local diag = vim.api.nvim_create_augroup('Diagnosticals', { clear = true })
vim.api.nvim_create_autocmd('CursorHold', {
    group = diag,
    pattern = '*',
    callback = function()
	vim.diagnostic.open_float(nil, { focusable = false })
    end
})
