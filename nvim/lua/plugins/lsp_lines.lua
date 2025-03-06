return{
	"https://git.sr.ht/~whynothugo/lsp_lines.nvim",
	config = function()
		require("lsp_lines").setup()
			vim.keymap.set("", "<Leader>c",
			require("lsp_lines").toggle,
				{ desc = "Toggle lsp_lines" }
			)
			vim.diagnostic.config({
  virtual_text = false,
})

	end,
}
