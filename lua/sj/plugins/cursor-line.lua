return {
	"yamatsum/nvim-cursorline",
	config = function()
		require("nvim-cursorline").setup({
			disable_filetypes = { "image", "snacks_picker_input", "snacks_dashboard", "TelescopePrompt", "snacks_layout_box" },
			disable_buftypes = { "nofile", "terminal", "prompt" },
			cursorline = {
				enable = true, -- Highlight the current line
				timeout = 500, -- Delay in ms before highlighting
				number = false, -- Highlight line number
			},
			cursorword = {
				enable = true, -- Highlight word under cursor
				min_length = 3, -- Minimum word length to highlight
				hl = { underline = true, bold = true }, -- Highlight style
			},
		})
	end,
}
