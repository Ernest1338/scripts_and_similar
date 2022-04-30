-- file location: ~/.config/nvim/init.lua

-- REQUIRE SECTION

-- load the packer plugins file
require('plugins')
-- keybindings file
require('keybindings')
-- editor configs
require('config')

-- PLUGINS CONFIG SECTION

-- setting up the lualine plugin
require('lualine').setup {
  options = {
	  theme = 'tokyonight'
  }
}

-- setting up treesitter
require('nvim-treesitter.configs').setup {
	highlight = {
		enable = true,
	},
	indent = {
		enable = true,
	}
}

-- folding support with treesitter
--vim.o.foldmethod = "expr"
--vim.o.foldexpr = "nvim_treesitter#foldexpr()"

-- setting up the auto brackets plugin
require('nvim-autopairs').setup{}

-- setting up the "magit" plugin
require('neogit').setup{}

-- setting up the file tree plugin
require('nvim-tree').setup{}

-- settings up the completition framework
local cmp = require('cmp')
cmp.setup{
	snippet = {
		expand = function(args)
			require('luasnip').lsp_expand(args.body)
		end,
	},
	sources = {
        {name = 'buffer', option = {keyword_length = 2}},
		{name = 'nvim_lsp'},
		{name = 'luasnip'},
		{name = 'path'},
	},
	mapping = cmp.mapping.preset.insert({
		['<C-u>'] = cmp.mapping.scroll_docs(-4),
		['<C-d>'] = cmp.mapping.scroll_docs(4),
		['<C-k>'] = cmp.mapping.select_prev_item(),
		['<C-j>'] = cmp.mapping.select_next_item(),
		['<C-e>'] = cmp.mapping.abort(),
		['<Tab>'] = cmp.mapping.confirm({
			--behavior = cmp.ConfirmBehavior.Insert,
			select = true
		}),
		['<CR>'] = cmp.mapping.confirm({
			--behavior = cmp.ConfirmBehavior.Insert,
			select = true
		}),
    }),
}

-- LSP settings

-- Rust
require('lspconfig').rust_analyzer.setup{}

