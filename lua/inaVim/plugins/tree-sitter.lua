--Parser generator
--
return {
	{
		'nvim-treesitter/nvim-treesitter',
		lazy = false,
		build = ":TSUpdate",
		config = function()
			local langs = { 'go', 'gomod', 'gosum', 'lua', 'html', 'bash' } 
			require('nvim-treesitter').install(langs)
			vim.api.nvim_create_autocmd('FileType', {
				callback = function(args)
					local buf, filetype = args.buf, args.match

					local language = vim.treesitter.language.get_lang(filetype)
					if not language then return end

					--Check if parser exists and load it
					if not vim.treesitter.language.add(language) then return end

					--Enable syntax highlighting and other features
					vim.treesitter.start(buf, language)

					--Folds
					--vim.wo[0][0].foldexpr = 'v:lua.vim.treesitter.foldexpr()'
					--vim.wo[0][0].foldmethod = 'expr'

					--Indentation
					vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
				end,
			})
		end,
	}
}
