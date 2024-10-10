return {
	"folke/tokyonight.nvim",
	lazy = false,
	priority = 1000,
	opts = {
		transparent = true,
		styles = {
			sidebars = "transparent",
			float = "transparent",
		},
	},
	config = function()
		require("tokyonight").setup({})
	end,
}
