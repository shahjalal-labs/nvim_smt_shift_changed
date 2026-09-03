return {
	"yetone/avante.nvim",
	event = "VeryLazy",
	lazy = false,
	version = false, -- pull latest
	init = function()
		vim.env.GEMINI_API_KEY = vim.env.GEMINI_API_KEY or "AIzaSyCTuTXZB__binAROvalrqiwgScgF0jWttA"
		vim.g.avante = {
			input = {
				provider = "snacks",
			},
		}
	end,
	opts = {
		provider = "gemini",
		providers = {
			gemini = {
				model = "gemini-3.8-flash",
				temperature = 0,
			},
		},
		mappings = {
			ask = "<leader>Aa",
			new_ask = "<leader>An",
			edit = "<leader>Ae",
			refresh = "<leader>Ar",
			focus = "<leader>Af",
			zen_mode = "<leader>Az",
			stop = "<leader>AS",
			toggle = {
				default = "<leader>At",
				debug = "<leader>Ad",
				selection = "<leader>AC",
				suggestion = "<leader>As",
				repomap = "<leader>AR",
			},
		},
		history = {
			max_tokens = 1048576, -- No restrictive token limit on history
		},
		behaviour = {
			auto_suggestions = false, -- Experimental, can be noisy
			auto_set_highlight_group = true,
			auto_set_keymaps = true,
			auto_apply_diff_after_generation = false,
			support_paste_from_clipboard = false,
		},
		hints = { enabled = true },
		windows = {
			position = "right",
			wrap = true,
			width = 40,
			sidebar_header = {
				enabled = true,
				align = "center",
				rounded = true,
			},
		},
	},
	build = "make",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"stevearc/dressing.nvim",
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
		"nvim-tree/nvim-web-devicons",
		{
			-- Markdown rendering for Avante sidebar chat
			"MeanderingProgrammer/render-markdown.nvim",
			opts = {
				file_types = { "markdown", "Avante" },
			},
			ft = { "markdown", "Avante" },
		},
	},
}
