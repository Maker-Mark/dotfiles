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

require'nvim-lsp-installer'.setup {}

require'lspconfig'.rust_analyzer.setup {
    capabilities = capabilities,
    on_attach = on_attach,
    ["rust-analyzer"] = {
	checkonsave = { command = "clippy" },
    },
}
require'lspconfig'.sumneko_lua.setup {
    capabilities = capabilities,
    on_attach = on_attach,
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
		library = {[
		    vim.fn.expand('$VIMRUNTIME/lua')] = true,
		    [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
		}
	    },
	},
    }
}

vim.opt.completeopt = {"menu", "menuone", "noselect"}

local cmp = require'cmp'
cmp.setup({
  snippet = {
    expand = function(args)
        vim.fn["vsnip#anonymous"](args.body)
    end,
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
    pattern = "*",
    callback = function()
	vim.diagnostic.open_float(nil, { focusable = false })
    end
})
