return {
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			--vim.cmd.colorscheme("tokyonight-night") --tokyonight-night-storm-day-moon
		end
	},
	{
		"rebelot/kanagawa.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd.colorscheme("kanagawa-wave") --kanagawa-dragon-wave-lotus
		end
	},
}
