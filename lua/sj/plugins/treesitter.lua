return {
	"nvim-treesitter/nvim-treesitter",
	lazy = false,
	build = ":TSUpdate",
	dependencies = {
		"windwp/nvim-ts-autotag",
	},
	init = function()
		-- Filetype to parser registrations
		vim.treesitter.language.register("http", "kulala_http")
		vim.treesitter.language.register("tsx", "typescriptreact")
		vim.treesitter.language.register("javascript", "javascriptreact")
	end,
	config = function()
		local ok, treesitter = pcall(require, "nvim-treesitter")
		if not ok then
			vim.notify("nvim-treesitter not available", vim.log.levels.ERROR)
			return
		end

		treesitter.setup({
			install_dir = vim.fn.stdpath("data") .. "/site",
		})

		-- Install parsers if not already installed
		treesitter.install({
			"json",
			"javascript",
			"typescript",
			"tsx",
			"yaml",
			"html",
			"css",
			"prisma",
			"markdown",
			"markdown_inline",
			"svelte",
			"graphql",
			"bash",
			"lua",
			"vim",
			"dockerfile",
			"gitignore",
			"query",
			"vimdoc",
			"c",
			"http",
		})

		-- Auto-start treesitter (highlighting, parsing) for any buffer with an available parser
		vim.api.nvim_create_autocmd("FileType", {
			callback = function(args)
				pcall(vim.treesitter.start, args.buf)
			end,
		})

		-- Setup nvim-ts-autotag
		local ok_autotag, autotag = pcall(require, "nvim-ts-autotag")
		if ok_autotag then
			autotag.setup({})
		end
	end,
}
