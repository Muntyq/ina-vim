-- configs for specific lsp server
--
local capabilities = require('cmp_nvim_lsp').default_capabilities()
vim.lsp.config('*', {
	capabilities = capabilities,
})
vim.lsp.config('lua_ls', {
	settings = { Lua = { diagnostics = { globals = { 'vim' }}}}
})
vim.lsp.config('qmlls', {
	-- if qml doesn't work change this to where 'pacman -Ql qt6-declarative | grep qmlls' points
	cmd = { '/usr/lib/qt6/bin/qmlls'}
})

-- pluguin for handling the lsp
--
return {
	{
		'mason-org/mason-lspconfig.nvim',
		opts = {
			-- use the vim.lsp.config names! source: https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md
			ensure_installed = { "lua_ls", "gopls" }
		},
		dependencies = {
			'mason-org/mason.nvim',
			'neovim/nvim-lspconfig',
		},
	},
	{
		'mason-org/mason.nvim',
		opts = {
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗"
				}
			}
		}
	},
	{
		'neovim/nvim-lspconfig',
		config = function()

			vim.api.nvim_create_autocmd('LspAttach', {
				callback = function(args)
					local map = function(keys, func, desc)
						vim.keymap.set("n", keys, func, { buffer = args.buf, desc = "LSP: " .. desc })

					end

					map('grr', vim.lsp.buf.rename, '[R]ename')
					map('gra', vim.lsp.buf.code_action, '[G]oto Code [A]ction')
					map('grh', vim.lsp.buf.hover, '[H]over Documentation')
					map('grd', vim.lsp.buf.type_definition, '[G]oto [D]efinition')
					map('grn', function() vim.diagnostic.jump({ count = 1 }) end, '[G]oto [N]ext Diagnostic')
					map('grp', function() vim.diagnostic.jump({ count = -1 }) end, '[G]oto [P]revious Diagnostic')

				end
			})
		end

	},
}
