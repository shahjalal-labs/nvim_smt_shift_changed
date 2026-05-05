## 📄 Module Files & Contents

### `cursor-line.lua`

```lua
return {
	"yamatsum/nvim-cursorline",
	config = function()
		require("nvim-cursorline").setup({
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
```

### `rainbow-matching.lua`

```lua
-- Enhanced vim-matchup configuration
return {
	"andymass/vim-matchup",
	config = function()
		-- Show offscreen matches in a popup window
		vim.g.matchup_matchparen_offscreen = {
			method = "popup",
			fullwidth = 1,
			highlight = "Normal",
			border = "rounded",
		}

		-- Performance options
		vim.g.matchup_matchparen_deferred = 1
		vim.g.matchup_matchparen_timeout = 100
		vim.g.matchup_matchparen_insert_timeout = 30

		-- Enhanced highlighting
		vim.g.matchup_matchparen_hi_surround_always = 1
		vim.g.matchup_surround_enabled = 1

		-- Module configuration
		vim.g.matchup_transmute_enabled = 1
		vim.g.matchup_mouse_enabled = 0 -- Disable mouse features

		-- Additional text objects
		vim.g.matchup_text_obj_enabled = 1
		vim.g.matchup_delim_noskips = 2 -- Don't skip comments
	end,
}
```

### `twilight.lua`

```lua
-- Lua
return {
	"folke/twilight.nvim",
	opts = {
		-- your configuration comes here
		-- or leave it empty to use the default settings
		-- refer to the configuration section below
	},
}
```

### `web_socket.lua`

```lua
return {
	"livinglogic-nl/ws.nvim",
	-- no special config needed for minimal usage
	config = function()
		-- optional: you could set up custom commands / keymaps here if ws.nvim exported any
		-- e.g. vim.api.nvim_set_keymap("n", "<leader>ws", ":lua require('ws').something()<CR>", { noremap = true, silent = true })
	end,
}
```

### `telescope.lua`

```lua
return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		"nvim-tree/nvim-web-devicons",
		"folke/todo-comments.nvim",
	},
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")

		telescope.setup({
			defaults = {
				path_display = { "smart" },
				mappings = {
					i = {
						["<C-k>"] = actions.move_selection_previous, -- move to prev result
						["<C-j>"] = actions.move_selection_next, -- move to next result
						["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
					},
				},
			},
		})

		telescope.load_extension("fzf")

		-- set keymaps
		local keymap = vim.keymap -- for conciseness

		keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })
		keymap.set("i", "<M-e>", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })
		keymap.set("n", "<M-e>", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })
		keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Fuzzy find recent files" })
		keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", { desc = "Find string in cwd" })
		keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", { desc = "Find string under cursor in cwd" })
		keymap.set(
			"n",
			"<leader>fm",
			":lua require('telescope.builtin').command_history()<CR>",
			{ desc = "Command history picker" }
		)

		keymap.set("n", "<leader>ft", "<cmd>TodoTelescope<cr>", { desc = "Find todos" })
		keymap.set(
			"n",
			"<leader>fk",
			":lua require('telescope.builtin').keymaps()<CR>",
			{ noremap = true, silent = true }
		)
		--[[ 		keymap.set(
			{ "n", "i", "v", "o" },
			"<M-j>",
			"<cmd>Telescope find_files cwd=src<cr>",
			{ desc = "Fuzzy find files in src directory" }
		) ]]
	end,
}
--w: 20/12/2024 07:48 PM Fri GMT+6 Sharifpur, Gazipur, Dhaka
```

### `smearCursor.lua`

```lua
return {
	"sphamba/smear-cursor.nvim",
	enabled = false,
	opts = {
		-- Smear cursor when switching buffers or windows.
		smear_between_buffers = true,

		-- Smear cursor when moving within line or to neighbor lines.
		-- Use `min_horizontal_distance_smear` and `min_vertical_distance_smear` for finer control
		smear_between_neighbor_lines = true,

		-- Draw the smear in buffer space instead of screen space when scrolling
		scroll_buffer_space = true,

		-- Set to `true` if your font supports legacy computing symbols (block unicode symbols).
		-- Smears will blend better on all backgrounds.
		legacy_computing_symbols_support = false,

		-- Smear cursor in insert mode.
		-- See also `vertical_bar_cursor_insert_mode` and `distance_stop_animating_vertical_bar`.
		smear_insert_mode = true,
	},
}
```

### `dbee.lua`

```lua
return {
	"kndndrj/nvim-dbee",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope.nvim",
	},
	config = function()
		require("dbee").setup({
			prefix = "<leader>D",
			connections = {
				main = "postgres://postgres:sj@localhost:5432/postgre-basics", -- replace with your DB URL
			},
		})
	end,
}
```

### `trouble.lua`

```lua
return {
	"folke/trouble.nvim",
	opts = {}, -- for default options, refer to the configuration section for custom setup.
	cmd = "Trouble",
	keys = {
		{
			"<leader>xx",
			"<cmd>Trouble diagnostics toggle<cr>",
			desc = "Diagnostics (Trouble)",
		},
		{
			"<leader>xX",
			"<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
			desc = "Buffer Diagnostics (Trouble)",
		},
		{
			"<leader>cs",
			"<cmd>Trouble symbols toggle focus=false<cr>",
			desc = "Symbols (Trouble)",
		},
		{
			"<leader>cl",
			"<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
			desc = "LSP Definitions / references / ... (Trouble)",
		},
		{
			"<leader>xL",
			"<cmd>Trouble loclist toggle<cr>",
			desc = "Location List (Trouble)",
		},
		{
			"<leader>xQ",
			"<cmd>Trouble qflist toggle<cr>",
			desc = "Quickfix List (Trouble)",
		},
	},
}
```

### `surround.lua`

```lua
return {
  "kylechui/nvim-surround",
  event = { "BufReadPre", "BufNewFile" },
  version = "*", -- Use for stability; omit to use `main` branch for the latest features
  config = true,
}
```

### `lsp/mason.lua`

```lua
--[[ return {
	{
		"williamboman/mason.nvim",
		config = function()
			local mason = require("mason")
			mason.setup({
				ui = {
					icons = {
						package_installed = "✓",
						package_pending = "➜",
						package_uninstalled = "✗",
					},
				},
			})
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = { "williamboman/mason.nvim" },
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"vtsls",
					"html",
					"cssls",
					"tailwindcss",
					"lua_ls",
					"emmet_ls",
					-- "prismals",
					-- "pyright",
					-- "pylint", -- python linter
				},
			})
		end,
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		dependencies = {
			"williamboman/mason.nvim",
		},
		config = function()
			require("mason-tool-installer").setup({
				ensure_installed = {
					"prettier",
					"stylua",
					"eslint_d",
				},
			})
		end,
	},
} ]]
--- updated for adding bashscript

return {
	{
		"williamboman/mason.nvim",
		config = function()
			local mason = require("mason")
			mason.setup({
				ui = {
					icons = {
						package_installed = "✓",
						package_pending = "➜",
						package_uninstalled = "✗",
					},
				},
			})
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = { "williamboman/mason.nvim" },
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"vtsls",
					"html",
					"cssls",
					"tailwindcss",
					"lua_ls",
					"emmet_ls",
					"bashls", -- Add bash language server
					-- "prismals",
					-- "pyright",
				},
			})
		end,
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		dependencies = {
			"williamboman/mason.nvim",
		},
		config = function()
			require("mason-tool-installer").setup({
				ensure_installed = {
					"prettier",
					"stylua",
					"eslint_d",
					"shellcheck", -- Add shell linter
					"shfmt", -- Add shell formatter
					-- Optional: "beautysh" as an alternative formatter
				},
			})
		end,
	},
}
```

### `lsp/lspconfig.lua`

```lua
-- for solving the deprecated warning
return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		{ "antosha417/nvim-lsp-file-operations", config = true },
		{ "folke/neodev.nvim", opts = {} },
	},
	config = function()
		local lspconfig = require("lspconfig")
		local mason_lspconfig = require("mason-lspconfig")
		local cmp_nvim_lsp = require("cmp_nvim_lsp")
		local keymap = vim.keymap

		-- Modern diagnostic signs (no sign_define)
		vim.diagnostic.config({
			signs = {
				text = {
					[vim.diagnostic.severity.ERROR] = " ",
					[vim.diagnostic.severity.WARN] = " ",
					[vim.diagnostic.severity.HINT] = "󰠠 ",
					[vim.diagnostic.severity.INFO] = " ",
				},
			},
		})

		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("UserLspConfig", {}),
			callback = function(ev)
				local opts = { buffer = ev.buf, silent = true }

				opts.desc = "Show LSP references"
				keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts)

				opts.desc = "Go to declaration"
				keymap.set("n", "gD", vim.lsp.buf.declaration, opts)

				opts.desc = "Show LSP definitions"
				keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)

				opts.desc = "Show LSP implementations"
				keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts)

				opts.desc = "Show LSP type definitions"
				keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts)

				opts.desc = "See available code actions"
				keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)

				opts.desc = "Smart rename"
				keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)

				opts.desc = "Show buffer diagnostics"
				keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts)

				opts.desc = "Show line diagnostics"
				keymap.set("n", "<leader>dd", vim.diagnostic.open_float, opts)

				opts.desc = "Go to previous diagnostic"
				keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)

				opts.desc = "Go to next diagnostic"
				keymap.set("n", "]d", vim.diagnostic.goto_next, opts)

				opts.desc = "Show documentation for what is under cursor"
				keymap.set("n", "K", vim.lsp.buf.hover, opts)

				opts.desc = "Restart LSP"
				keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts)
			end,
		})

		local capabilities = cmp_nvim_lsp.default_capabilities()

		mason_lspconfig.setup_handlers({
			function(server_name)
				lspconfig[server_name].setup({
					capabilities = capabilities,
				})
			end,
			-- Add this new block for TypeScript
			["vtsls"] = function()
				lspconfig.vtsls.setup({
					capabilities = capabilities,
					settings = {
						typescript = {
							--[[ preferences = {
								importModuleSpecifier = "non-relative",
							}, ]]
						},
						javascript = {
							--[[ preferences = {
								importModuleSpecifier = "non-relative",
							}, ]]
						},
					},
				})
			end,

			["prismals"] = function()
				lspconfig.prismals.setup({
					capabilities = capabilities,
					filetypes = { "prisma" },
				})
			end,

			["svelte"] = function()
				lspconfig["svelte"].setup({
					capabilities = capabilities,
					on_attach = function(client, bufnr)
						vim.api.nvim_create_autocmd("BufWritePost", {
							pattern = { "*.js", "*.ts" },
							callback = function(ctx)
								client.notify("$/onDidChangeTsOrJsFile", { uri = ctx.match })
							end,
						})
					end,
				})
			end,
			["graphql"] = function()
				lspconfig["graphql"].setup({
					capabilities = capabilities,
					filetypes = { "graphql", "gql", "svelte", "typescriptreact", "javascriptreact" },
				})
			end,
			["emmet_ls"] = function()
				lspconfig["emmet_ls"].setup({
					capabilities = capabilities,
					filetypes = {
						"html",
						"zls",
						"typescriptreact",
						"javascriptreact",
						"css",
						"sass",
						"scss",
						"less",
						"svelte",
					},
				})
			end,
			["lua_ls"] = function()
				lspconfig["lua_ls"].setup({
					capabilities = capabilities,
					settings = {
						Lua = {
							diagnostics = {
								globals = { "vim" },
							},
							completion = {
								callSnippet = "Replace",
							},
						},
					},
				})
			end,
		})
	end,
}
```

### `dad_bod.lua`

```lua
-- ~/.config/nvim/lua/plugins/db.lua
return {
	"tpope/vim-dadbod",
	dependencies = {
		"kristijanhusak/vim-dadbod-ui",
		"kristijanhusak/vim-dadbod-completion",
	},
	cmd = { "DB", "DBUI" },
}
```

### `init.lua`

```lua
return {
	"nvim-lua/plenary.nvim", -- lua functions that many plugins use
	"christoomey/vim-tmux-navigator", -- tmux & split window navigation
}
```

### `autopairs.lua`

```lua
return {
  "windwp/nvim-autopairs",
  event = { "InsertEnter" },
  dependencies = {
    "hrsh7th/nvim-cmp",
  },
  config = function()
    -- import nvim-autopairs
    local autopairs = require("nvim-autopairs")

    -- configure autopairs
    autopairs.setup({
      check_ts = true, -- enable treesitter
      ts_config = {
        lua = { "string" }, -- don't add pairs in lua string treesitter nodes
        javascript = { "template_string" }, -- don't add pairs in javscript template_string treesitter nodes
        java = false, -- don't check treesitter on java
      },
    })

    -- import nvim-autopairs completion functionality
    local cmp_autopairs = require("nvim-autopairs.completion.cmp")

    -- import nvim-cmp plugin (completions plugin)
    local cmp = require("cmp")

    -- make autopairs and completion work together
    cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
  end,
}
```

### `image.lua`

```lua
-- ~/.config/nvim/lua/plugins/image.lua
return {
	{
		"3rd/image.nvim",
		build = false, -- skip native rock build
		enabled = false,
		opts = { -- pass options directly
			processor = "magick_cli", -- use ImageMagick CLI
			backend = "kitty", -- optional: "kitty", "ueberzug", "sixel"
			integrations = {
				markdown = {
					enabled = true,
					download_remote_images = true,
				},
			},
		},
	},
}
```

### `auto-session.lua`

```lua
return {
	"rmagatti/auto-session",
	config = function()
		local auto_session = require("auto-session")

		auto_session.setup({
			auto_restore_enabled = true,
			auto_session_suppress_dirs = { "~/", "~/Dev/", "~/Downloads", "~/Documents", "~/Desktop/" },
		})

		local keymap = vim.keymap

		keymap.set("n", "<leader>wr", "<cmd>SessionRestore<CR>", { desc = "Restore session for cwd" }) -- restore last workspace session for current directory
		keymap.set("n", "<leader>ws", "<cmd>SessionSave<CR>", { desc = "Save session for auto session root dir" }) -- save workspace session for current working directory
	end,
}
```

### `lazygit.lua`

```lua
return {
	"kdheepak/lazygit.nvim",
	cmd = {
		"LazyGit",
		"LazyGitConfig",
		"LazyGitCurrentFile",
		"LazyGitFilter",
		"LazyGitFilterCurrentFile",
	},
	-- optional for floating window border decoration
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	-- setting the keybinding for LazyGit with 'keys' is recommended in
	-- order to load the plugin when the command is run for the first time
	keys = {
		{ "<leader>lg", "<cmd>LazyGit<cr>", desc = "Open lazy git" },
	},
}
```

### `winshift.lua`

```lua
return {
	"sindrets/winshift.nvim",
	config = function()
		require("winshift").setup({
			highlight_moving_win = true,
			focused_hl_group = "Visual",
			moving_hl_group = "Visual",
		})

		-- Custom keymaps - use <Leader>wj to start window shifting
		vim.keymap.set("n", "<Leader>wj", ":WinShift<CR>", { desc = "Start window shift mode" })
		-- Direct swap commands (no interactive mode)
		vim.keymap.set("n", "<Leader>pu", "<cmd>WinShift left<CR>")
		vim.keymap.set("n", "<Leader>pi", "<cmd>WinShift right<CR>")
		vim.keymap.set("n", "<Leader>pk", "<cmd>WinShift up<CR>")
		vim.keymap.set("n", "<Leader>pj", "<cmd>WinShift down<CR>")
		vim.keymap.set("n", "<Leader>ps", "<cmd>WinShift swap<CR>")
		-- Optional: Disable default <Leader>ws if you want only <Leader>wj
		-- vim.keymap.del("n", "<Leader>ws")
	end,
}
```

### `alpha.lua`

```lua
return {
	"goolord/alpha-nvim",
	event = "VimEnter",
	config = function()
		local alpha = require("alpha")
		local dashboard = require("alpha.themes.dashboard")

		-- Set header
		dashboard.section.header.val = {
			"                                                     ",
			"  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
			"  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
			"  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
			"  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
			"  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
			"  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
			"                                                     ",
		}

		-- Set menu
		dashboard.section.buttons.val = {
			dashboard.button("e", "  > New File", "<cmd>ene<CR>"),
			dashboard.button("SPC ee", "  > Toggle file explorer", "<cmd>NvimTreeToggle<CR>"),
			dashboard.button("SPC ff", "󰱼 > Find File", "<cmd>Telescope find_files<CR>"),
			dashboard.button("SPC fs", "  > Find Word", "<cmd>Telescope live_grep<CR>"),
			dashboard.button("SPC wr", "󰁯  > Restore Session For Current Directory", "<cmd>SessionRestore<CR>"),
			dashboard.button("q", " > Quit NVIM", "<cmd>qa<CR>"),
		}

		-- Send config to alpha
		alpha.setup(dashboard.opts)

		-- Disable folding on alpha buffer
		vim.cmd([[autocmd FileType alpha setlocal nofoldenable]])
	end,
}
```

### `tailwind-tools.lua`

```lua
-- tailwind-tools.lua
return {
	"luckasRanarison/tailwind-tools.nvim",
	name = "tailwind-tools",
	build = ":UpdateRemotePlugins",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"nvim-telescope/telescope.nvim", -- optional
		"neovim/nvim-lspconfig", -- optional
	},
	opts = {}, -- your configuration
}
```

### `comment.lua`

```lua
return {
	"numToStr/Comment.nvim",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"JoosepAlviste/nvim-ts-context-commentstring",
	},
	config = function()
		-- import comment plugin safely
		local comment = require("Comment")

		local ts_context_commentstring = require("ts_context_commentstring.integrations.comment_nvim")

		-- enable comment
		comment.setup({
			-- for commenting tsx, jsx, svelte, html files
			pre_hook = ts_context_commentstring.create_pre_hook(),
		})
	end,
}
```

### `grugFar.lua`

```lua
return {
	"MagicDuck/grug-far.nvim",
	-- Note (lazy loading): grug-far.lua defers all it's requires so it's lazy by default
	-- additional lazy config to defer loading is not really needed...
	config = function()
		-- optional setup call to override plugin options
		-- alternatively you can set options with vim.g.grug_far = { ... }
		require("grug-far").setup({
			-- options, see Configuration section below
			-- there are no required options atm
		})
	end,
}
```

### `tiny_glimmer.lua`

```lua
return {
	"rachartier/tiny-glimmer.nvim",
	event = "VeryLazy",
	priority = 10, -- Needs to be a really low priority, to catch others plugins keybindings.
	opts = {
		-- your configuration
	},
}
```

### `tailwind.lua`

```lua
return {
	{
		"neovim/nvim-lspconfig",
		opts = {
			servers = {
				tailwindcss = {},
			},
		},
	},
	{
		"NvChad/nvim-colorizer.lua",
		opts = {
			user_default_options = {
				tailwind = true,
			},
		},
	},
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			{ "roobert/tailwindcss-colorizer-cmp.nvim", config = true },
		},
		opts = function(_, opts)
			-- Ensure opts.formatting exists
			opts.formatting = opts.formatting or {}

			-- Ensure opts.formatting.format is defined
			local format_kinds = opts.formatting.format or function(_, item)
				return item
			end

			opts.formatting.format = function(entry, item)
				format_kinds(entry, item) -- Add icons
				return require("tailwindcss-colorizer-cmp").formatter(entry, item)
			end
		end,
	},
}

--
--
--
-- return {
-- 	{
-- 		"neovim/nvim-lspconfig",
-- 		opts = {
-- 			servers = {
-- 				tailwindcss = {},
-- 			},
-- 		},
-- 	},
-- 	{
-- 		"NvChad/nvim-colorizer.lua",
-- 		opts = {
-- 			user_default_options = {
-- 				tailwind = true,
-- 			},
-- 		},
-- 	},
-- 	{
-- 		"hrsh7th/nvim-cmp",
-- 		dependencies = {
-- 			{ "roobert/tailwindcss-colorizer-cmp.nvim", config = true },
-- 		},
-- 		opts = function(_, opts)
-- 			-- original LazyVim kind icon formatter
-- 			local format_kinds = opts.formatting.format
-- 			opts.formatting.format = function(entry, item)
-- 				format_kinds(entry, item) -- add icons
-- 				return require("tailwindcss-colorizer-cmp").formatter(entry, item)
-- 			end
-- 		end,
-- 	},
-- }
```

### `autoSave.lua`

```lua
-- ~/.config/nvim/lua/sj/plugins/autoSave.lua
-- SIMPLIFIED VERSION - No complex autocmds

return {
	{
		"okuuva/auto-save.nvim",
		enabled = true,
		cmd = "ASToggle",
		event = { "InsertLeave", "TextChanged" },
		opts = {
			enabled = true,
			trigger_events = {
				immediate_save = { "BufLeave", "FocusLost", "QuitPre" },
				defer_save = {
					"InsertLeave",
					"TextChanged",
				},
				cancel_deferred_save = {
					"InsertEnter",
				},
			},
			condition = function(buf)
				-- Don't save in insert mode
				if vim.fn.mode() == "i" then
					return false
				end

				local filetype = vim.bo[buf].filetype
				local bufname = vim.fn.bufname(buf)

				-- 🚫 Don't save these filetypes
				local excluded_ft = {
					"harpoon",
					"mysql",
					"sql",
					"dbout",
					"snacks_input",
					"snacks_picker_input",
				}

				if vim.tbl_contains(excluded_ft, filetype) then
					return false
				end

				-- 🚫 Don't save Dad Bod buffers (timestamp pattern)
				if bufname:match("%d%d%d%d%-%d%d%-%d%d%-%d%d%-%d%d%-%d%d") then
					return false
				end

				-- 🚫 Don't save query/result buffers
				if
					bufname:match("^query%-")
					or bufname:match(".*%-Columns%-")
					or bufname:match(".*%-Indexes%-")
					or bufname:match(".*%-References%-")
				then
					return false
				end

				-- ✅ Save everything else
				return true
			end,
			debounce_delay = 2000,
			debug = false,
		},
	},
}
```

### `hurl.lua`

```lua
-- Run the current Hurl request block from normal mode.
-- Finds the nearest `# ` header as the start, the next `# ` as the end,
-- ignores `#/` inline comments, selects the block automatically,
-- and runs `:HurlRunner` without manual visual selection.

--w: (start)╭──────────── run_hurl_block ────────────╮
local function run_hurl_block()
	local bufnr = vim.api.nvim_get_current_buf()
	local cursor = vim.api.nvim_win_get_cursor(0)
	local cur_line = cursor[1]
	local total = vim.api.nvim_buf_line_count(bufnr)

	local start_line = nil
	local end_line = nil

	-- Find block start (search upward)
	for i = cur_line, 1, -1 do
		local line = vim.api.nvim_buf_get_lines(bufnr, i - 1, i, false)[1]
		if line:match("^#%s+") then
			start_line = i
			break
		end
	end

	if not start_line then
		vim.notify("No Hurl block start found", vim.log.levels.WARN)
		return
	end

	-- Find block end (next valid header)
	for i = start_line + 1, total do
		local line = vim.api.nvim_buf_get_lines(bufnr, i - 1, i, false)[1]
		if line:match("^#%s+") then
			end_line = i - 1
			break
		end
	end

	-- If last block
	if not end_line then
		end_line = total
	end

	-- Select the block
	vim.cmd("normal! " .. start_line .. "GV" .. end_line .. "G")

	-- -- Run Hurl
	-- vim.cmd("HurlRunner")
end

vim.keymap.set("n", "<leader>th", run_hurl_block, {
	desc = "Run current Hurl block",
})

vim.keymap.set("n", "t", run_hurl_block, {
	desc = "Run current Hurl block",
})
--w: (end)  ╰──────────── run_hurl_block ────────────╯

return {
	"jellydn/hurl.nvim",
	dependencies = {
		"MunifTanjim/nui.nvim",
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
		-- Optional, for markdown rendering with render-markdown.nvim
		{
			"MeanderingProgrammer/render-markdown.nvim",
			opts = {
				file_types = { "markdown" },
			},
			ft = { "markdown" },
		},
	},
	ft = "hurl",
	opts = {
		-- Show debugging info
		debug = false,
		-- Show notification on run
		show_notification = false,
		-- Show response in popup or split
		mode = "split",
		auto_close = false,
		-- Default formatter
		formatters = {
			json = { "jq" }, -- Make sure you have install jq in your system, e.g: brew install jq
			html = {
				"prettier", -- Make sure you have install prettier in your system, e.g: npm install -g prettier
				"--parser",
				"html",
			},
			xml = {
				"tidy", -- Make sure you have installed tidy in your system, e.g: brew install tidy-html5
				"-xml",
				"-i",
				"-q",
			},
		},
		-- Default mappings for the response popup or split views
		mappings = {
			close = "q", -- Close the response popup or split view
			next_panel = "<C-n>", -- Move to the next response popup window
			prev_panel = "<C-p>", -- Move to the previous response popup window
		},
	},
	keys = {
		-- Run API request
		{ "<leader>hh", "<cmd>HurlRunner<CR>", desc = "Run All requests" },
		{ "<leader>hl", "<cmd>HurlShowLastResponse<CR>", desc = "Run All requests" },
		{ "<leader>hj", "<cmd>HurlRunnerAt<CR>", desc = "Run Api request" },
		{ "<leader>he", "<cmd>HurlRunnerToEntry<CR>", desc = "Run Api request to entry" },
		{ "<leader>hE", "<cmd>HurlRunnerToEnd<CR>", desc = "Run Api request from current entry to end" },
		-- { "<leader>hm", "<cmd>HurlToggleMode<CR>", desc = "Hurl Toggle Mode" },
		{ "<leader>hm", "<cmd>HurlManageVariable<CR>", desc = "Hurl Toggle Mode" },
		-- { "<leader>hv", "<cmd>HurlVerbose<CR>", desc = "Run Api in verbose mode" },
		{ "<leader>hv", "<cmd>HurlManageVariable<CR>", desc = "Run Api in verbose mode" },
		{ "<leader>hV", "<cmd>HurlVeryVerbose<CR>", desc = "Run Api in very verbose mode" },
		-- Run Hurl request in visual mode
		{ "<leader>h", ":HurlRunner<CR>", desc = "Hurl Runner", mode = "v" },
		{ "t", ":HurlRunner<CR>", desc = "Hurl Runner", mode = "v" },
	},
}
```

### `formatting.lua`

```lua
return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")

		conform.setup({
			formatters_by_ft = {
				javascript = { "prettier" },
				typescript = { "prettier" },
				javascriptreact = { "prettier" },
				typescriptreact = { "prettier" },
				svelte = { "prettier" },
				css = { "prettier" },
				html = { "prettier" },
				json = { "prettier" },
				yaml = { "prettier" },
				markdown = { "prettier" },
				graphql = { "prettier" },
				liquid = { "prettier" },
				lua = { "stylua" },
				python = { "isort", "black" },
			},
			format_on_save = {
				lsp_fallback = true,
				async = false,
				timeout_ms = 1000,
			},
		})

		vim.keymap.set({ "n", "v" }, "<leader>mp", function()
			conform.format({
				lsp_fallback = true,
				async = false,
				timeout_ms = 1000,
			})
		end, { desc = "Format file or range (in visual mode)" })
	end,
}
```

### `vim-maximizer.lua`

```lua
return {
	"szw/vim-maximizer",
	keys = {
		{ "<leader>sm", "<cmd>MaximizerToggle<CR>", desc = "Maximize/minimize a split" },
	},
}
```

### `nvim-cmp.lua`

```lua
return {
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	dependencies = {
		"hrsh7th/cmp-buffer", -- source for text in buffer
		"hrsh7th/cmp-path", -- source for file system paths
		{
			"L3MON4D3/LuaSnip",
			-- follow latest release.
			version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
			-- install jsregexp (optional!).
			build = "make install_jsregexp",
		},
		"saadparwaiz1/cmp_luasnip", -- for autocompletion
		"rafamadriz/friendly-snippets", -- useful snippets
		"onsails/lspkind.nvim", -- vs-code like pictograms
		"hrsh7th/cmp-emoji",
		"kristijanhusak/vim-dadbod-completion",
	},
	config = function()
		local cmp = require("cmp")

		local luasnip = require("luasnip")

		local lspkind = require("lspkind")

		-- loads vscode style snippets from installed plugins (e.g. friendly-snippets)
		require("luasnip.loaders.from_vscode").lazy_load()

		cmp.setup({
			completion = {
				completeopt = "menu,menuone,preview,noselect",
			},
			snippet = { -- configure how nvim-cmp interacts with snippet engine
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},
			mapping = cmp.mapping.preset.insert({
				["<C-k>"] = cmp.mapping.select_prev_item(), -- previous suggestion
				["<C-j>"] = cmp.mapping.select_next_item(), -- next suggestion
				["<C-b>"] = cmp.mapping.scroll_docs(-4),
				["<C-f>"] = cmp.mapping.scroll_docs(4),
				["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestions
				["<C-e>"] = cmp.mapping.abort(), -- close completion window
				["<CR>"] = cmp.mapping.confirm({ select = false }),
			}),
			-- sources for autocompletion
			sources = cmp.config.sources({
				{ name = "nvim_lsp" },
				{ name = "luasnip" }, -- snippets
				{ name = "buffer" }, -- text within current buffer
				{ name = "path" }, -- file system paths
				{ name = "emoji" }, -- file system paths
				{ name = "vim-dadbod-completion" }, -- Add this line
				-- { name = "supermaven" }, -- file system paths
			}),

			-- configure lspkind for vs-code like pictograms in completion menu
			formatting = {
				format = lspkind.cmp_format({
					maxwidth = 50,
					ellipsis_char = "...",
				}),
			},
		})
	end,
}
```

### `yanky.lua`

```lua
return {
	"gbprod/yanky.nvim",
	opts = {
		ring = {
			history_length = 100,
			storage = "shada",
			sync_with_numbered_registers = true,
			cancel_event = "update",
			ignore_registers = { "_" },
			update_register_on_cycle = false,
		},
		system_clipboard = {
			sync_with_ring = true,
		},
	},
	config = function(_, opts)
		-- Load the configuration for yanky.nvim
		require("yanky").setup(opts)

		-- Set keymaps after setting up Yanky with the options
		vim.keymap.set({ "n", "x" }, "p", "<Plug>(YankyPutAfter)", { desc = "Yanky Put After" })
		vim.keymap.set({ "n", "x" }, "P", "<Plug>(YankyPutBefore)", { desc = "Yanky Put Before" })
		vim.keymap.set({ "n", "x" }, "gp", "<Plug>(YankyGPutAfter)", { desc = "Yanky GPut After" })
		vim.keymap.set({ "n", "x" }, "gP", "<Plug>(YankyGPutBefore)", { desc = "Yanky GPut Before" })
		vim.keymap.set("n", "<c-p>", "<Plug>(YankyPreviousEntry)", { desc = "Yanky Previous Entry" })
		vim.keymap.set("n", "<c-n>", "<Plug>(YankyNextEntry)", { desc = "Yanky Next Entry" })
		-- Visual mode: prevent overwrite of yank
		vim.keymap.set("x", "p", '"_dP', { desc = "Replace selection correctly" })
		vim.keymap.set("x", "P", '"_dP', { desc = "Replace selection correctly" })
	end,
	vim.api.nvim_set_keymap(
		"i",
		"<leader>yp",
		[[<Esc>:lua require("telescope").extensions.yank_history.yank_history({})<CR>]],
		{ noremap = true, silent = true }
	),
}
```

### `hl_match.lua`

```lua
return {
	{
		"rareitems/hl_match_area.nvim",
		config = function()
			require("hl_match_area").setup()
			-- Optionally, customize the highlight color, for example:
			-- vim.api.nvim_set_hl(0, 'MatchArea', { bg = "#FFFFFF" })
		end,
	},
	-- other plugins ...
}
```

### `neotree.lua`

```lua
-- https://github.com/nvim-neo-tree/neo-tree.nvim

return {
	{
		"nvim-neo-tree/neo-tree.nvim",
		-- This disables or enables the plugin
		-- I'm switching over to mini.files (mini-files.lua) because neotree had
		-- some issues for me, when renaming files or directories sometimes they
		-- didn't update so had to be using oil.nvim
		-- enabled = true,
		enabled = true,
		lazy = "very",
		event = "VeryLazy",
		keys = {
			-- I'm using these 2 keyamps already with mini.files, so avoiding conflict
			{ "<leader>e", false },
			{ "<leader>E", false },
			-- -- I swapped these 2
			-- { "<leader>e", "<leader>fE", desc = "Explorer NeoTree (cwd)", remap = true },
			-- { "<leader>E", "<leader>fe", desc = "Explorer NeoTree (root dir)", remap = true },
			-- New mapping for spacebar+r to reveal in NeoTree
			-- New mapping for spacebar+r to reveal in NeoTree with toggle functionality

			-- -- When I press <leader>r I want to show the current file in neo-tree,
			-- -- But if neo-tree is open it, close it, to work like a toggle
			{
				"<leader>rf",
				function()
					-- Function to check if NeoTree is open in any window
					local function is_neo_tree_open()
						for _, win in ipairs(vim.api.nvim_list_wins()) do
							local buf = vim.api.nvim_win_get_buf(win)
							if vim.bo[buf].filetype == "neo-tree" then
								return true
							end
						end
						return false
					end
					if is_neo_tree_open() then
						-- Close NeoTree if it's open
						vim.cmd("Neotree close")
					else
						-- Open NeoTree if it's not open
						vim.cmd("Neotree reveal")
					end
				end,
				desc = "[P]Toggle current file in NeoTree",
			},
			-- {
			--   "<leader>r",
			--   function()
			--     vim.cmd("Neotree reveal")
			--   end,
			--   desc = "Reveal current file in NeoTree",
			-- },
		},
		opts = {
			filesystem = {
				-- Had to disable this option, because when I open neotree it was
				-- jumping around to random dirs when I opened a dir
				follow_current_file = { enabled = false },

				-- ###################################################################
				--                     custom delete command
				-- ###################################################################
				-- Adding custom commands for delete and delete_visual
				-- https://github.com/nvim-neo-tree/neo-tree.nvim/issues/202#issuecomment-1428278234
				commands = {
					-- over write default 'delete' command to 'trash'.
					delete = function(state)
						if vim.fn.executable("trash") == 0 then
							vim.api.nvim_echo({
								{ "- Trash utility not installed. Make sure to install it first\n", nil },
								{ "- In macOS run `brew install trash`\n", nil },
								{ "- Or delete the `custom delete command` section in neo-tree", nil },
							}, false, {})
							return
						end
						local inputs = require("neo-tree.ui.inputs")
						local path = state.tree:get_node().path
						local msg = "Are you sure you want to trash " .. path
						inputs.confirm(msg, function(confirmed)
							if not confirmed then
								return
							end

							vim.fn.system({ "trash", vim.fn.fnameescape(path) })
							require("neo-tree.sources.manager").refresh(state.name)
						end)
					end,
					-- Overwrite default 'delete_visual' command to 'trash' x n.
					delete_visual = function(state, selected_nodes)
						if vim.fn.executable("trash") == 0 then
							vim.api.nvim_echo({
								{ "- Trash utility not installed. Make sure to install it first\n", nil },
								{ "- In macOS run `brew install trash`\n", nil },
								{ "- Or delete the `custom delete command` section in neo-tree", nil },
							}, false, {})
							return
						end
						local inputs = require("neo-tree.ui.inputs")

						-- Function to get the count of items in a table
						local function GetTableLen(tbl)
							local len = 0
							for _ in pairs(tbl) do
								len = len + 1
							end
							return len
						end

						local count = GetTableLen(selected_nodes)
						local msg = "Are you sure you want to trash " .. count .. " files?"
						inputs.confirm(msg, function(confirmed)
							if not confirmed then
								return
							end
							for _, node in ipairs(selected_nodes) do
								vim.fn.system({ "trash", vim.fn.fnameescape(node.path) })
							end
							require("neo-tree.sources.manager").refresh(state.name)
						end)
					end,
				},
			},
		},
	},
}
```

### `treesitter.lua`

```lua
return {
	"nvim-treesitter/nvim-treesitter",
	event = { "BufReadPre", "BufNewFile" },
	build = ":TSUpdate",
	dependencies = {
		"windwp/nvim-ts-autotag",
	},
	config = function()
		-- import nvim-treesitter plugin
		local treesitter = require("nvim-treesitter.configs")

		-- configure treesitter
		treesitter.setup({ -- enable syntax highlighting
			highlight = {
				enable = true,
			},
			-- enable indentation
			indent = { enable = true },
			-- enable autotagging (w/ nvim-ts-autotag plugin)
			autotag = {
				enable = true,
			},
			-- ensure these language parsers are installed
			ensure_installed = {
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
				"bash",
			},
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "<C-space>",
					node_incremental = "<C-space>",
					scope_incremental = false,
					node_decremental = "<bs>",
				},
			},
		})
		-- 	-- Setup nvim-ts-autotag
		-- 	require("nvim-ts-autotag").setup({
		-- 		enable_close = true, -- Enable auto closing of tags
		-- 		enable_rename = true, -- Enable auto renaming of tags
		-- 	})
	end,
}
```

### `web-tools.lua`

```lua
-- Place this in your lazy plugin configuration (usually in lua/plugins/web-tools.lua)
return {
	{
		"ray-x/web-tools.nvim",
		dependencies = {
			"ray-x/guihua.lua",
			"neovim/nvim-lspconfig",
		},
		opts = {
			keymaps = {
				rename = nil, -- by default use same setup of lspconfig
				repeat_rename = ".",
			},
		},
		keys = {
			{
				"<leader>ll",
				function()
					vim.cmd("BrowserPreview") -- Open current file in browser
				end,
				desc = "Preview HTML in browser",
			},
			{
				"<leader>ls",
				function()
					vim.cmd("BrowserSync") -- Start browser-sync server
				end,
				desc = "Start browser-sync server",
			},
			{
				"<leader>lr",
				function()
					vim.cmd("BrowserRestart") -- Restart browser-sync server
				end,
				desc = "Restart browser-sync server",
			},
			{
				"<leader>lx",
				function()
					vim.cmd("BrowserStop") -- Stop browser-sync server
				end,
				desc = "Stop browser-sync server",
			},
		},
		config = function()
			-- Basic setup
			require("web-tools").setup({})

			-- Set up autocommand for HTML files
			vim.api.nvim_create_autocmd("FileType", {
				pattern = { "html", "htm", "sh" },
				callback = function()
					-- You can add specific settings for HTML files here
					vim.opt_local.expandtab = true
					vim.opt_local.shiftwidth = 2
					vim.opt_local.softtabstop = 2
				end,
			})
		end,
	},
}
```

### `md-pdf.lua`

```lua
---@type LazyPluginSpec
return {
	"arminveres/md-pdf.nvim",
	branch = "main",
	lazy = true,
	ft = { "markdown" },
	keys = {
		{
			"<leader>p,",
			function()
				require("md-pdf").convert_md_to_pdf()
			end,
			desc = "Convert Markdown to PDF",
		},
	},
	opts = {
		margins = "1.5cm",
		highlight = "tango",
		toc = true,
		preview_cmd = function()
			return "firefox"
		end,
		ignore_viewer_state = false,
		fonts = {
			main_font = nil,
			sans_font = "DejaVuSans",
			mono_font = "IosevkaTerm Nerd Font Mono",
			math_font = nil,
		},
		pandoc_user_args = {
			"-V geometry:margin=1.5cm",
			"--standalone=true",
		},
		output_path = "./",
		pdf_engine = "pdflatex",
	},
	config = function(_, opts)
		require("md-pdf").setup(opts)
	end,
}
```

### `colorful-winsep.lua`

```lua
-- highlight color which nvim pane is focused/ like tmux active pane indicator
return {
	"nvim-zh/colorful-winsep.nvim",
	config = true,
	event = { "WinLeave" },
}
```

### `indent-blankline.lua`

```lua
return {
  "lukas-reineke/indent-blankline.nvim",
  event = { "BufReadPre", "BufNewFile" },
  main = "ibl",
  opts = {
    indent = { char = "┊" },
  },
}
```

### `yazi.lua`

```lua
---@type LazySpec
return {
	"mikavilpas/yazi.nvim",
	event = "VeryLazy",
	keys = {
		-- 👇 in this section, choose your own keymappings!
		{
			"<leader>yy",
			"<cmd>Yazi<cr>",
			desc = "Open yazi at the current file",
		},
		{
			-- Open in the current working directory
			"<leader>cw",
			"<cmd>Yazi cwd<cr>",
			desc = "Open the file manager in nvim's working directory",
		},
		{
			-- NOTE: this requires a version of yazi that includes
			-- https://github.com/sxyazi/yazi/pull/1305 from 2024-07-18
			"<c-v>",
			"<cmd>Yazi toggle<cr>",
			desc = "Resume the last yazi session",
		},
	},
	---@type YaziConfig
	opts = {
		-- if you want to open yazi instead of netrw, see below for more info
		open_for_directories = false,
		keymaps = {
			show_help = "<f1>",
		},
	},
}
```

### `nvim-tree.lua`

```lua
return {
	"nvim-tree/nvim-tree.lua",
	dependencies = "nvim-tree/nvim-web-devicons",
	enabled = true,
	-- enabled = false,
	config = function()
		local nvimtree = require("nvim-tree")

		-- recommended settings from nvim-tree documentation
		vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1

		nvimtree.setup({
			view = {
				width = 35,
				relativenumber = true,
			},
			-- change folder arrow icons
			renderer = {
				indent_markers = {
					enable = true,
				},
				icons = {
					glyphs = {
						folder = {
							arrow_closed = "", -- arrow when folder is closed
							arrow_open = "", -- arrow when folder is open
						},
					},
				},
			},
			-- disable window_picker for
			-- explorer to work well with
			-- window splits
			actions = {
				open_file = {
					window_picker = {
						enable = false,
					},
				},
			},
			filters = {
				custom = { ".DS_Store" },
			},
			git = {
				ignore = false,
			},
		})

		-- set keymaps
		local keymap = vim.keymap -- for conciseness

		keymap.set({ "n", "i" }, "<leader>ee", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file explorer" }) -- toggle file explorer
		keymap.set(
			"n",
			"<leader>ef",
			"<cmd>NvimTreeFindFileToggle<CR>",
			{ desc = "Toggle file explorer on current file" }
		) -- toggle file explorer on current file
		keymap.set("n", "<leader>ec", "<cmd>NvimTreeCollapse<CR>", { desc = "Collapse file explorer" }) -- collapse file explorer
		keymap.set("n", "<leader>er", "<cmd>NvimTreeRefresh<CR>", { desc = "Refresh file explorer" }) -- refresh file explorer
	end,
}
```

### `colorscheme.lua`

```lua
return {
	{
		"folke/tokyonight.nvim",
		priority = 1000, -- make sure to load this before all the other start plugins
		config = function()
			local bg = "#011628"
			local bg_dark = "#011423"
			local bg_highlight = "#143652"
			local bg_search = "#0A64AC"
			local bg_visual = "#275378"
			local fg = "#CBE0F0"
			local fg_dark = "#B4D0E9"
			local fg_gutter = "#627E97"
			local border = "#547998"

			require("tokyonight").setup({
				style = "night",
				on_colors = function(colors)
					colors.bg = bg
					colors.bg_dark = bg_dark
					colors.bg_float = bg_dark
					colors.bg_highlight = bg_highlight
					colors.bg_popup = bg_dark
					colors.bg_search = bg_search
					colors.bg_sidebar = bg_dark
					colors.bg_statusline = bg_dark
					colors.bg_visual = bg_visual
					colors.border = border
					colors.fg = fg
					colors.fg_dark = fg_dark
					colors.fg_float = fg
					colors.fg_gutter = fg_gutter
					colors.fg_sidebar = fg_dark
				end,
			})
			-- load the colorscheme here
			vim.cmd([[colorscheme tokyonight]])
		end,
	},
}
```

### `treesitter-textobjects.lua`

```lua
return {
	"nvim-treesitter/nvim-treesitter-textobjects",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
	},
	event = "VeryLazy",
	config = function()
		require("nvim-treesitter.configs").setup({
			textobjects = {

				-- =====================
				-- SELECT TEXT OBJECTS
				-- =====================
				select = {
					enable = true,
					lookahead = true, -- jump forward automatically

					keymaps = {
						-- functions
						["af"] = "@function.outer",
						["if"] = "@function.inner",

						-- classes
						["ac"] = "@class.outer",
						["ic"] = "@class.inner",

						-- blocks (if / for / while / try)
						["ab"] = "@block.outer",
						["ib"] = "@block.inner",

						-- parameters / arguments
						["aa"] = "@parameter.outer",
						["ia"] = "@parameter.inner",

						-- calls (function calls)
						["am"] = "@call.outer",
						["im"] = "@call.inner",
					},
				},

				-- =====================
				-- MOVE BETWEEN OBJECTS
				-- =====================
				move = {
					enable = true,
					set_jumps = true,

					goto_next_start = {
						["]f"] = "@function.outer",
						["]c"] = "@class.outer",
						["]b"] = "@block.outer",
					},
					goto_previous_start = {
						["[f"] = "@function.outer",
						["[c"] = "@class.outer",
						["[b"] = "@block.outer",
					},
				},

				-- =====================
				-- SWAP PARAMETERS
				-- =====================
				swap = {
					enable = true,
					swap_next = {
						["<leader>sa"] = "@parameter.inner",
					},
					swap_previous = {
						["<leader>sA"] = "@parameter.inner",
					},
				},
			},
		})
	end,
}
```

### `linting.lua`

```lua
return {
	"mfussenegger/nvim-lint",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local lint = require("lint")

		lint.linters_by_ft = {
			javascript = { "eslint_d" },
			typescript = { "eslint_d" },
			javascriptreact = { "eslint_d" },
			typescriptreact = { "eslint_d" },
			svelte = { "eslint_d" },
			python = { "pylint" },
		}

		local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

		vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
			group = lint_augroup,
			callback = function()
				lint.try_lint()
			end,
		})

		vim.keymap.set("n", "<leader>lc", function()
			lint.try_lint()
		end, { desc = "Trigger linting for current file" })
	end,
}
```

### `dressing.lua`

```lua
return {
  "stevearc/dressing.nvim",
  event = "VeryLazy",
}
```

### `kulala.lua`

```lua
return {
	"mistweaverco/kulala.nvim",
	keys = {
		{ "<leader>Rs", desc = "Send request" },
		{ "<leader>Ra", desc = "Send all requests" },
		{ "<leader>Rb", desc = "Open scratchpad" },
	},
	ft = { "http", "rest" },
	opts = {
		-- your configuration comes here
		global_keymaps = true,
		global_keymaps_prefix = "<leader>R",
		kulala_keymaps_prefix = "",
		lsp = { formatter = true },
		fold_response = true,
	},
}
```

### `comfy-line-numbers.lua`

```lua
return {
	"mluders/comfy-line-numbers.nvim",
}
```

### `emoji.lua`

```lua
return {
	"allaman/emoji.nvim",
	version = "1.0.0", -- Optionally pin to a specific version
	dependencies = {
		"nvim-lua/plenary.nvim", -- Required for handling paths
		"hrsh7th/nvim-cmp", -- Optional for cmp integration
		"nvim-telescope/telescope.nvim", -- Optional for Telescope integration
		"ibhagwan/fzf-lua", -- Optional for fzf-lua integration via vim.ui.select
	},
	opts = {
		enable_cmp_integration = true, -- Enable nvim-cmp integration
		plugin_path = vim.fn.stdpath("data") .. "/lazy/", -- Adjust if needed
	},
	config = function(_, opts)
		require("emoji").setup(opts)
		-- Optional: Setup Telescope keybinding for emoji search
		local ts = require("telescope").load_extension("emoji")
		vim.keymap.set({ "n", "i" }, "<leader>ii", ts.emoji, { desc = "[S]earch [E]moji" })
	end,
}
```

### `hop.lua`

```lua
return {
	"phaazon/hop.nvim",
	branch = "v2", -- optional but strongly recommended
	config = function()
		-- you can configure Hop the way you like here; see :h hop-config
		require("hop").setup({ keys = "etovxqpdygfblzhckisuran" })
	end,
}
```

### `error-lens.lua`

```lua
return {
	"chikko80/error-lens.nvim",
	event = "BufRead",
	dependencies = {
		"nvim-telescope/telescope.nvim",
	},
	opts = {
		-- your options go here{
		-- this setting tries to auto adjust the colors
		-- based on the diagnostic-highlight groups and your
		-- theme background color with a color blender
		enabled = true,
		auto_adjust = {
			enable = false,
			fallback_bg_color = nil, -- mandatory if enable true (e.g. #281478)
			step = 7, -- inc: colors should be brighter/darker
			total = 30, -- steps of blender
		},
		prefix = 4, -- distance code <-> diagnostic message
		-- default colors
		colors = {
			error_fg = "#FF6363", -- diagnostic font color
			error_bg = "#1e1e1e", -- diagnostic line color
			warn_fg = "#1B252C",
			warn_bg = "#1e1e1e",
			info_fg = "#5B38E8",
			info_bg = "#281478",
			hint_fg = "#25E64B",
			hint_bg = "#147828",
		},
	},
}
```

### `mason-workaround.lua`

```lua
-- ~/.config/nvim/lua/plugins/mason-workaround.lua
-- for solving the issue of masong updating to version 2
return {
	{ "mason-org/mason.nvim", version = "^1.0.0" },
	{ "mason-org/mason-lspconfig.nvim", version = "^1.0.0" },
}
```

### `logsitter.lua`

```lua
return {
	"gaelph/logsitter.nvim",
	dependencies = { "nvim-treesitter/nvim-treesitter" },
	config = function()
		require("nvim-treesitter.configs").setup({
			ensure_installed = { "javascript", "typescript" },
			highlight = { enable = true },
		})

		require("logsitter").setup({
			path_format = "default",
			prefix = "[LS] ->",
			separator = "->",
		})

		local map = vim.api.nvim_set_keymap
		local opts = { noremap = true, silent = true }

		map(
			"n",
			"<leader>la",
			':lua require("logsitter.commands").log_line()<CR>',
			vim.tbl_extend("force", opts, { desc = "Logsitter: Log current line" })
		)
		map(
			"n",
			"<leader>lf",
			':lua require("logsitter.commands").log_function()<CR>',
			vim.tbl_extend("force", opts, { desc = "Logsitter: Log current function" })
		)
		map(
			"v",
			"<leader>lv",
			':lua require("logsitter.commands").log_selection()<CR>',
			vim.tbl_extend("force", opts, { desc = "Logsitter: Log visual selection" })
		)
	end,
}
```

### `neoscroll.lua`

```lua
return {
	"karb94/neoscroll.nvim",
	enabled = true,
	opts = {},
}
```

### `copilotChat.lua`

```lua
return {
	"CopilotC-Nvim/CopilotChat.nvim",
	dependencies = {
		{ "github/copilot.vim" }, -- or zbirenbaum/copilot.lua
		{ "nvim-lua/plenary.nvim", branch = "master" }, -- for curl, log and async functions
	},
	build = "make tiktokten", -- Only on MacOS or Linux
	opts = {
		-- See Configuration section for options
	},
	keys = {
		{ "<leader>zc", ":CopilotChat<CR>", mode = "n", desc = "Chat with Copilot" },
		{ "<leader>ze", ":CopilotChatExplain<CR>", mode = "v", desc = "Explain Code" },
		{ "<leader>zr", ":CopilotChatReview<CR>", mode = "v", desc = "Review Code" },
		{ "<leader>zf", ":CopilotChatFix<CR>", mode = "v", desc = "Fix Code Issues" },
		{ "<leader>zo", ":CopilotChatOptimize<CR>", mode = "v", desc = "Optimize Code" },
		{ "<leader>zd", ":CopilotChatDocs<CR>", mode = "v", desc = "Generate Docs" },
		{ "<leader>zt", ":CopilotChatTests<CR>", mode = "v", desc = "Generate Tests" },
		{ "<leader>zm", ":CopilotChatCommit<CR>", mode = "n", desc = "Generate Commit Message" },
		{ "<leader>zs", ":CopilotChatCommit<CR>", mode = "v", desc = "Generate Commit for Selection" },
	},
}
```

### `snacks.lua`

```lua
return {
	"folke/snacks.nvim",
	event = "VeryLazy",
	opts = {
		explorer = {
			enabled = true, -- Enables the built-in file explorer feature from snacks.nvim
		},

		picker = {
			enabled = true, -- Enables the picker UI for various search/navigation sources

			sources = {
				files = {
					hidden = true, -- Show hidden files when using the file picker
					ignored = false, -- Show ignored files (from .gitignore or similar)
				},

				explorer = {
					hidden = true, -- Show hidden files in the file explorer
					ignored = false, -- Show ignored files in the explorer
				},

				git_files = {
					hidden = false, -- Include hidden files when picking Git-tracked files
					ignored = false, -- Include ignored files when picking Git-tracked files
				},

				grep = {
					hidden = false, -- Search in hidden files with live grep
					ignored = false, -- Search in ignored files with live grep
				},

				grep_word = {
					hidden = false, -- Grep the current word (or visual selection) including hidden files
					ignored = false, -- Grep the current word including ignored files
				},

				grep_buffers = {
					hidden = false, -- Grep open buffers including hidden files
					ignored = false, -- Grep open buffers including ignored files
				},
			},
		},
		telescope = {
			defaults = {
				file_ignore_patterns = {
					"node_modules", -- ignore all node_modules
					"%.lock", -- ignore lockfiles
					"%.min.js", -- optionally ignore minified js
				},
			},
		},
	},
	keys = function()
		local Snacks = require("snacks")

		return {
			-- Top Pickers & Explorer
			{
				"<leader>,/",
				function()
					Snacks.picker.grep()
				end,
				desc = "Grep",
			},
			{
				"<leader>,<space>",
				function()
					Snacks.picker.smart()
				end,
				desc = "Smart Find Files",
			},
			{
				"<leader>,si",
				function()
					Snacks.picker.icons()
				end,
				desc = "Icons",
			},
			{
				"<leader>,:",
				function()
					Snacks.picker.command_history()
				end,
				desc = "Command History",
			},
			{
				"<leader>,,",
				function()
					Snacks.explorer()
				end,
				desc = "File Explorer",
			},
			{
				"<leader>,ff",
				function()
					Snacks.picker.files()
				end,
				desc = "Find Files",
			},
			{
				"<M-j>",
				function()
					Snacks.picker.files()
				end,
				desc = "Find Files",
			},
			{
				"<leader>,gb",
				function()
					Snacks.picker.git_branches()
				end,
				desc = "Git Branches",
			},
			{
				"<leader>,fp",
				function()
					Snacks.picker.projects()
				end,
				desc = "Projects",
			},
			{
				"<leader>,sg",
				function()
					Snacks.picker.grep()
				end,
				desc = "Grep",
			},
			{
				"<leader>,sw",
				function()
					Snacks.picker.grep_word()
				end,
				desc = "Grep Word or Visual Selection",
				mode = { "n", "x" },
			},
			{
				"<leader>,ad",
				function()
					Snacks.picker.git_diff()
				end,
				desc = "Git Diff (Hunks)",
			},
			{
				"<leader>,sc",
				function()
					Snacks.picker.command_history()
				end,
				desc = "Command History",
			},
			{
				"<leader>,sC",
				function()
					Snacks.picker.commands()
				end,
				desc = "Commands",
			},
			{
				"<leader>,sd",
				function()
					Snacks.picker.diagnostics()
				end,
				desc = "Diagnostics",
			},
			{
				"<leader>,sj",
				function()
					Snacks.picker.jumps()
				end,
				desc = "Jumps",
			},
			{
				"<leader>,sk",
				function()
					Snacks.picker.keymaps()
				end,
				desc = "Keymaps",
			},
			{
				"<leader>,sm",
				function()
					Snacks.picker.marks()
				end,
				desc = "Marks",
			},
			{
				"<leader>,sq",
				function()
					Snacks.picker.qflist()
				end,
				desc = "Quickfix List",
			},
			{
				"<leader>,cR",
				function()
					Snacks.rename.rename_file()
				end,
				desc = "Rename File",
			},
			{
				"<leader>gm",
				function()
					Snacks.gitbrowse()
				end,
				desc = "Git Browse",
				mode = { "n", "v" },
			},
			{
				"<leader>,gg",
				function()
					Snacks.lazygit()
				end,
				desc = "Lazygit",
			},
			{
				"<leader>,un",
				function()
					Snacks.notifier.hide()
				end,
				desc = "Dismiss Notifications",
			},
			{
				"<leader>,e",
				function()
					Snacks.picker.buffers()
				end,
				desc = "Buffers",
			},

			{
				"<leader>,n",
				function()
					Snacks.picker.notifications()
				end,
				desc = "Notification History",
			},

			-- Find
			{
				"<leader>,fb",
				function()
					Snacks.picker.buffers()
				end,
				desc = "Buffers",
			},
			{
				"<leader>,fc",
				function()
					Snacks.picker.files({ cwd = vim.fn.stdpath("config") })
				end,
				desc = "Find Config File",
			},

			{
				"<leader>,fg",
				function()
					Snacks.picker.git_files()
				end,
				desc = "Find Git Files",
			},

			{
				"<leader>,fr",
				function()
					Snacks.picker.recent()
				end,
				desc = "Recent",
			},

			-- Git

			{
				"<leader>,gl",
				function()
					Snacks.picker.git_log()
				end,
				desc = "Git Log",
			},
			{
				"<leader>,gL",
				function()
					Snacks.picker.git_log_line()
				end,
				desc = "Git Log Line",
			},
			{
				"<leader>,gs",
				function()
					Snacks.picker.git_status()
				end,
				desc = "Git Status",
			},
			{
				"<leader>,gS",
				function()
					Snacks.picker.git_stash()
				end,
				desc = "Git Stash",
			},

			{
				"<leader>,gf",
				function()
					Snacks.picker.git_log_file()
				end,
				desc = "Git Log File",
			},

			-- Grep
			{
				"<leader>,sb",
				function()
					Snacks.picker.lines()
				end,
				desc = "Buffer Lines",
			},
			{
				"<leader>,sB",
				function()
					Snacks.picker.grep_buffers()
				end,
				desc = "Grep Open Buffers",
			},

			-- Search
			{
				'<leader>,sb"',
				function()
					Snacks.picker.registers()
				end,
				desc = "Registers",
			},
			{
				"<leader>,s/",
				function()
					Snacks.picker.search_history()
				end,
				desc = "Search History",
			},
			{
				"<leader>,sa",
				function()
					Snacks.picker.autocmds()
				end,
				desc = "Autocmds",
			},

			{
				"<leader>,sD",
				function()
					Snacks.picker.diagnostics_buffer()
				end,
				desc = "Buffer Diagnostics",
			},
			{
				"<leader>,sh",
				function()
					Snacks.picker.help()
				end,
				desc = "Help Pages",
			},
			{
				"<leader>,sH",
				function()
					Snacks.picker.highlights()
				end,
				desc = "Highlights",
			},

			{
				"<leader>,sl",
				function()
					Snacks.picker.loclist()
				end,
				desc = "Location List",
			},

			{
				"<leader>,sM",
				function()
					Snacks.picker.man()
				end,
				desc = "Man Pages",
			},
			{
				"<leader>,sp",
				function()
					Snacks.picker.lazy()
				end,
				desc = "Search Plugin Spec",
			},

			{
				"<leader>,sR",
				function()
					Snacks.picker.resume()
				end,
				desc = "Resume Last Picker",
			},
			{
				"<leader>,su",
				function()
					Snacks.picker.undo()
				end,
				desc = "Undo History",
			},

			-- LSP
			{
				"<leader>,gd",
				function()
					Snacks.picker.lsp_definitions()
				end,
				desc = "Goto Definition",
			},
			{
				"<leader>,gD",
				function()
					Snacks.picker.lsp_declarations()
				end,
				desc = "Goto Declaration",
			},
			{
				"<leader>,gr",
				function()
					Snacks.picker.lsp_references()
				end,
				nowait = true,
				desc = "References",
			},
			{
				"<leader>,gI",
				function()
					Snacks.picker.lsp_implementations()
				end,
				desc = "Goto Implementation",
			},
			{
				"<leader>,gy",
				function()
					Snacks.picker.lsp_type_definitions()
				end,
				desc = "Goto Type Definition",
			},
			{
				"<leader>,ss",
				function()
					Snacks.picker.lsp_symbols()
				end,
				desc = "LSP Symbols",
			},
			{
				"<leader>,sS",
				function()
					Snacks.picker.lsp_workspace_symbols()
				end,
				desc = "LSP Workspace Symbols",
			},

			-- Other
			{
				"<leader>,z",
				function()
					Snacks.zen()
				end,
				desc = "Toggle Zen Mode",
			},
			{
				"<leader>,Z",
				function()
					Snacks.zen.zoom()
				end,
				desc = "Toggle Zoom",
			},
			{
				"<leader>,.",
				function()
					Snacks.scratch()
				end,
				desc = "Toggle Scratch Buffer",
			},
			{
				"<leader>,S",
				function()
					Snacks.scratch.select()
				end,
				desc = "Select Scratch Buffer",
			},
			{
				"<leader>,N",
				function()
					Snacks.win({
						file = vim.api.nvim_get_runtime_file("doc/news.txt", false)[1],
						width = 0.6,
						height = 0.6,
						wo = {
							spell = false,
							wrap = false,
							signcolumn = "yes",
							statuscolumn = " ",
							conceallevel = 3,
						},
					})
				end,
				desc = "Neovim News",
			},
			{
				"<leader>,bd",
				function()
					Snacks.bufdelete()
				end,
				desc = "Delete Buffer",
			},

			-- Terminal
			{
				"<leader>,_",
				function()
					Snacks.terminal()
				end,
				desc = "Toggle Terminal",
			},

			-- Word Navigation
			{
				"<leader>,]]",
				function()
					Snacks.words.jump(vim.v.count1)
				end,
				desc = "Next Reference",
				mode = { "n", "t" },
			},
			{
				"<leader>,[[",
				function()
					Snacks.words.jump(-vim.v.count1)
				end,
				desc = "Prev Reference",
				mode = { "n", "t" },
			},
		}
	end,
}
```

### `todo-comments.lua`

```lua
return {
	"folke/todo-comments.nvim",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local todo_comments = require("todo-comments")

		-- set keymaps
		local keymap = vim.keymap -- for conciseness

		keymap.set("n", "]t", function()
			todo_comments.jump_next()
		end, { desc = "Next todo comment" })

		keymap.set("n", "[t", function()
			todo_comments.jump_prev()
		end, { desc = "Previous todo comment" })

		-- Setup todo-comments with your desired configuration
		todo_comments.setup({
			signs = true, -- show icons in the signs column
			sign_priority = 8, -- sign priority
			keywords = {
				FIX = {
					icon = " ", -- icon used for the sign, and in search results
					color = "error", -- can be a hex color, or a named color (see below)
					alt = { "FIXME", "BUG", "FIXIT", "ISSUE" }, -- alternative keywords
				},
				t = { icon = " ", color = "error" },
				h = { icon = " ", color = "warning" },
				w = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
				p = { icon = " ", color = "default", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
				n = { icon = " ", color = "hint", alt = { "INFO" } },
				te = { icon = "⏲ ", color = "test", alt = { "TESTING", "PASSED", "FAILED" } },
			},
			gui_style = {
				fg = "NONE", -- The gui style to use for the fg highlight group.
				bg = "BOLD", -- The gui style to use for the bg highlight group.
			},
			merge_keywords = true, -- merge custom keywords with default ones
			highlight = {
				multiline = true, -- enable multiline todo comments
				multiline_pattern = "^.", -- lua pattern to match the next multiline
				multiline_context = 10, -- extra lines for context
				before = "", -- highlight before keyword
				keyword = "wide", -- highlight keyword (wide, wide_bg, etc.)
				after = "fg", -- highlight after the keyword
				pattern = [[.*<(KEYWORDS)\s*:]], -- pattern for highlighting
				comments_only = true, -- use treesitter to match in comments only
				max_line_len = 400, -- ignore lines longer than this
				exclude = {}, -- file types to exclude
			},
			colors = {
				error = { "DiagnosticError", "ErrorMsg", "#DC2626" },
				warning = { "DiagnosticWarn", "WarningMsg", "#FBBF24" },
				info = { "DiagnosticInfo", "#2563EB" },
				hint = { "DiagnosticHint", "#00E5FF" },
				default = { "Identifier", "#76FF03" },
				test = { "Identifier", "#FF00FF" },
			},
			search = {
				command = "rg",
				args = {
					"--color=never",
					"--no-heading",
					"--with-filename",
					"--line-number",
					"--column",
				},
				-- regex that will be used to match keywords.
				-- don't replace the (KEYWORDS) placeholder
				pattern = [[\b(KEYWORDS):]], -- ripgrep regex
			},
		})
	end,
}
```

### `multi-cursor.lua`

```lua
return {
	"brenton-leighton/multiple-cursors.nvim",
	version = "*",
	opts = {},
	keys = {
		-- Directional cursor add
		{ "<C-j>", "<Cmd>MultipleCursorsAddDown<CR>", mode = { "n", "x" }, desc = "Add cursor and move down" },
		{ "<C-k>", "<Cmd>MultipleCursorsAddUp<CR>", mode = { "n", "x" }, desc = "Add cursor and move up" },
		{ "<C-Down>", "<Cmd>MultipleCursorsAddDown<CR>", mode = { "n", "i", "x" }, desc = "Add cursor and move down" },
		{ "<C-Up>", "<Cmd>MultipleCursorsAddUp<CR>", mode = { "n", "i", "x" }, desc = "Add cursor and move up" },
		{ "<C-LeftMouse>", "<Cmd>MultipleCursorsMouseAddDelete<CR>", mode = { "n", "i" }, desc = "Add or remove cursor" },

		-- ⬅ Mnemonic group with <Leader>m
		{ "<Leader>ma", "<Cmd>MultipleCursorsAddMatches<CR>", mode = { "n", "x" }, desc = "Add cursors to matches" }, -- a = add
		{ "<Leader>mv", "<Cmd>MultipleCursorsAddVisualArea<CR>", mode = { "x" }, desc = "Add cursors to visual lines" }, -- v = visual
		{ "<Leader>mu", "<Cmd>MultipleCursorsAddUp<CR>", mode = { "n", "x" }, desc = "Add cursor upward" }, -- u = up
		{ "<Leader>md", "<Cmd>MultipleCursorsAddDown<CR>", mode = { "n", "x" }, desc = "Add cursor downward" }, -- d = down
		{
			"<Leader>mj",
			"<Cmd>MultipleCursorsAddJumpNextMatch<CR>",
			mode = { "n", "x" },
			desc = "Add cursor and jump next match",
		}, -- j = jump
		{ "<Leader>mn", "<Cmd>MultipleCursorsJumpNextMatch<CR>", mode = { "n", "x" }, desc = "Jump to next match" }, -- n = next
		{ "<Leader>mp", "<Cmd>MultipleCursorsJumpPrevMatch<CR>", mode = { "n", "x" }, desc = "Jump to previous match" }, -- p = previous
		{ "<Leader>ml", "<Cmd>MultipleCursorsLock<CR>", mode = { "n", "x" }, desc = "Lock cursors" }, -- l = lock
	},
}
```

### `gitsigns.lua`

```lua
return {
	"lewis6991/gitsigns.nvim",
	event = { "BufReadPre", "BufNewFile" },
	opts = {
		on_attach = function(bufnr)
			local gs = package.loaded.gitsigns

			local function map(mode, l, r, desc)
				vim.keymap.set(mode, l, r, { buffer = bufnr, desc = desc })
			end

			-- Navigation
			map("n", "]h", gs.next_hunk, "Next Hunk")
			map("n", "[h", gs.prev_hunk, "Prev Hunk")

			-- Actions
			map("n", "<leader>hs", gs.stage_hunk, "Stage hunk")
			map("n", "<leader>hr", gs.reset_hunk, "Reset hunk")
			map("v", "<leader>hs", function()
				gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
			end, "Stage hunk")
			map("v", "<leader>hr", function()
				gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
			end, "Reset hunk")

			map("n", "<leader>hS", gs.stage_buffer, "Stage buffer")
			map("n", "<leader>hR", gs.reset_buffer, "Reset buffer")

			map("n", "<leader>hu", gs.undo_stage_hunk, "Undo stage hunk")

			map("n", "<leader>hp", gs.preview_hunk, "Preview hunk")

			map("n", "<leader>hb", function()
				gs.blame_line({ full = true })
			end, "Blame line")
			map("n", "<leader>hB", gs.toggle_current_line_blame, "Toggle line blame")

			map("n", "<leader>hd", gs.diffthis, "Diff this")
			map("n", "<leader>hD", function()
				gs.diffthis("~")
			end, "Diff this ~")

			-- Text object
			map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", "Gitsigns select hunk")
		end,
	},
}
```

### `super_maven.lua`

```lua
return {
	"supermaven-inc/supermaven-nvim",
	enabled = false,
	config = function()
		require("supermaven-nvim").setup({
			keymaps = {
				accept_suggestion = "<Tab>",
				clear_suggestion = "<C-]>",
				accept_word = "<C-a>",
			},
			ignore_filetypes = { cpp = true }, -- or { "cpp", }
			color = {
				suggestion_color = "#A0A0A0",
				-- cterm = 244,
				cterm = 244,
			},
			log_level = "info", -- set to "off" to disable logging completely
			disable_inline_completion = false, -- disables inline completion for use with cmp
			disable_keymaps = false, -- disables built in keymaps for more manual control
			condition = function()
				return false
			end, -- condition to check for stopping supermaven, `true` means to stop supermaven when the condition is true.
		})
	end,
}
```

### `lua-snip.lua`

```lua
--w: ╭──────────── Block Start ────────────╮

--w: ╰───────────── Block End ─────────────╯

-- return {
-- 	{
-- 		"L3MON4D3/LuaSnip",
-- 		version = "v2.*",
-- 		dependencies = {
-- 			"rafamadriz/friendly-snippets",
-- 			"saadparwaiz1/cmp_luasnip",
-- 		},
-- 		config = function()
-- 			local ls = require("luasnip")
-- 			local s = ls.snippet
-- 			local t = ls.text_node
-- 			local f = ls.function_node
--
-- 			local function get_file_name()
-- 				local file = vim.fn.expand("%:t") -- Get the file name with extension
-- 				local name = file:match("(.+)%..+$") -- Remove the extension
-- 				return name or "Component" -- Fallback to "Component" if no name found
-- 			end
--
-- 			ls.add_snippets("typescriptreact", {
-- 				s("cc", {
-- 					f(function()
-- 						local name = get_file_name()
-- 						vim.schedule(function()
-- 							vim.cmd("stopinsert") -- This will exit to normal mode after snippet expansion
-- 						end)
-- 						return {
-- 							"export default function " .. name .. "() {",
-- 							"    return (",
-- 							"        <div>",
-- 							"            " .. name,
-- 							"        </div>",
-- 							"    );",
-- 							"}",
-- 						}
-- 					end),
-- 				}),
-- 			})
--
-- 			local i = ls.insert_node
--
-- 			-- HTML template snippet with placeholders for title and link href, final cursor inside the body tag
-- 			ls.add_snippets("html", {
-- 				s("h", {
-- 					t({
-- 						"<!doctype html>",
-- 						'<html lang="en">',
-- 						"  <head>",
-- 						'    <meta charset="UTF-8" />',
-- 						'    <meta name="viewport" content="width=device-width, initial-scale=1.0" />',
-- 						"    <title>",
-- 					}),
-- 					i(3), -- Empty placeholder for title
-- 					t({
-- 						"</title>",
-- 						'    <link rel="stylesheet" href="',
-- 					}),
-- 					i(2), -- Empty placeholder for link href
-- 					t({
-- 						'" />',
-- 						"  </head>",
-- 						"  <body>",
-- 					}),
-- 					i(1), -- Final cursor placement inside the <body> tag
-- 					t({
-- 						"  </body>",
-- 						"</html>",
-- 					}),
-- 				}),
-- 			})
--
-- 			ls.add_snippets("javascriptreact", {
-- 				s("a", {
-- 					t({ "const " }),
-- 					f(function() -- Removed unused snip parameter
-- 						local filename = vim.fn.expand("%:t:r")
-- 						return filename
-- 					end, {}),
-- 					t({ " = () => {", "  return (", "    <>", "      " }),
-- 					i(1, ""),
-- 					t({ "", "    </>", "  );", "};", "", "export default " }),
-- 					f(function() -- Removed unused snip parameter
-- 						local filename = vim.fn.expand("%:t:r")
-- 						return filename
-- 					end, {}),
-- 					t(";"),
-- 				}),
-- 			})
--
-- 			ls.add_snippets("typescriptreact", {
--
-- 				s("a", {
--
-- 					t({ "const " }),
-- 					f(function() -- Removed unused snip parameter
-- 						local filename = vim.fn.expand("%:t:r")
-- 						return filename
-- 					end, {}),
-- 					t({ " = () => {", "  return (", "    <>" }),
-- 					i(1, ""),
-- 					t({ "", "    </>", "  );", "};", "", "export default " }),
-- 					f(function() -- Removed unused snip parameter
-- 						local filename = vim.fn.expand("%:t:r")
-- 						return filename
-- 					end, {}),
-- 					t(";"),
-- 				}),
-- 			})
--
-- 			--
-- 			--
-- 			--
-- 			-- local ls = require("luasnip")
-- 			-- local s = ls.snippet
-- 			-- local t = ls.text_node
-- 			-- local i = ls.insert_node
-- 			-- local f = ls.function_node
-- 			--
-- 			-- Common filetypes for React components
-- 			local filetypes = {
-- 				"javascript",
-- 				"javascriptreact",
-- 				"typescript",
-- 				"typescriptreact",
-- 			}
--
-- 			-- Create the snippet
-- 			local react_component = s("b", {
-- 				t({ "const " }),
-- 				f(function()
-- 					local filename = vim.fn.expand("%:t:r")
-- 					return filename
-- 				end, {}),
-- 				f(function()
-- 					-- local ext = vim.fn.expand("%:e")
-- 					--[[ if ext == "tsx" or ext == "ts" then
-- 						return ": React.FC"
-- 					end ]]
-- 					return ""
-- 				end, {}),
-- 				t({ " = () => {", "  return (", "    <div>", "      " }),
-- 				i(1, ""),
-- 				t({ "", "    </div>", "  );", "};", "", "export default " }),
-- 				f(function()
-- 					local filename = vim.fn.expand("%:t:r")
-- 					return filename
-- 				end, {}),
-- 				t(";"),
-- 			})
--
-- 			-- Add the snippet to all specified filetypes
-- 			for _, ft in ipairs(filetypes) do
-- 				ls.add_snippets(ft, {
-- 					react_component,
-- 				})
-- 			end
--
-- 			--
-- 			--
-- 			--
-- 			--
-- 			--
-- 			--
-- 			--
-- 			--
--
-- 			ls.add_snippets("typescript", {
-- 				s("u", {
-- 					t("interface I"),
-- 					i(1, "Name"),
-- 					t({ " {", "    " }),
-- 					i(0),
-- 					t({ "", "}" }),
-- 				}),
-- 			})
--
-- 			ls.add_snippets("typescriptreact", {
-- 				s("u", {
-- 					t("interface I"),
-- 					i(1, "Name"),
-- 					t({ " {", "    " }),
-- 					i(0),
-- 					t({ "", "}" }),
-- 				}),
-- 			})
--
-- 			-- Type snippet
-- 			ls.add_snippets("typescript", {
-- 				s("ttype", {
-- 					t("type "), -- separate "type" and "T"
-- 					t("T"),
-- 					i(1, "Name"),
-- 					t(" = {"),
-- 					i(0),
-- 					t("}"),
-- 				}),
-- 			})
--
-- 			ls.add_snippets("typescript", {
-- 				s("ttype", {
-- 					t("type "), -- separate "type" and "T"
-- 					t("T"),
-- 					i(1, "Name"),
-- 					t(" = {"),
-- 					i(0),
-- 					t("}"),
-- 				}),
-- 			})
--
-- 			--
-- 			--
-- 			--
-- 			--w: ╭──────────── Block Start ────────────╮
-- 			-- next js dynamicDetails component page create
-- 			-- PascalCase helper
-- 			local function pascal_case(str)
-- 				return (str:gsub("(%a)(%w*)", function(a, b)
-- 					return a:upper() .. b:lower()
-- 				end))
-- 			end
--
-- 			-- Get folder name + "Details"
-- 			local function get_component_name(_, snip)
-- 				local dir = snip.env.TM_DIRECTORY
-- 				local parent = dir:match(".*/([^/]+)/%[.-%]$")
-- 				if not parent then
-- 					return "ComponentDetails"
-- 				end
-- 				return pascal_case(parent) .. "Details"
-- 			end
--
-- 			-- Get dynamic param name inside []
-- 			local function get_param_name(_, snip)
-- 				local dir = snip.env.TM_DIRECTORY
-- 				local param = dir:match(".*/%[(.-)%]$")
-- 				return param or "id"
-- 			end
--
-- 			local function exit_to_normal_mode()
-- 				vim.schedule(function()
-- 					vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>", true, false, true), "n", true)
-- 				end)
-- 			end
--
-- 			local function page_snippet(ft)
-- 				return {
-- 					s("d", {
-- 						t("const "),
-- 						f(get_component_name, {}),
-- 						t(" = async ({ params }) => {"),
-- 						t({ "", "  const p = await params;" }),
-- 						t({ "", "  console.log(p." }),
-- 						f(get_param_name, {}),
-- 						t({ ', "dynamicId in params", 3);', "", "", "  return (", "    <div>", "      <h2>" }),
-- 						f(get_component_name, {}),
-- 						i(0), -- Cursor will stop here
-- 						t({ "</h2>", "    </div>", "  );", "};", "", "export default " }),
-- 						f(get_component_name, {}),
-- 					}),
-- 				}
-- 			end
--
-- 			ls.add_snippets(nil, {
-- 				javascript = page_snippet("javascript"),
-- 				javascriptreact = page_snippet("javascriptreact"),
-- 				typescript = page_snippet("typescript"),
-- 				typescriptreact = page_snippet("typescriptreact"),
-- 			})
--
-- 			-- Hook to exit insert mode automatically after snippet expansion
-- 			ls.config.set_config({
-- 				store_selection_keys = "<Tab>",
-- 				updateevents = "TextChanged,TextChangedI",
-- 				-- Custom callback
-- 				snippet_exit = exit_to_normal_mode,
-- 			})
-- 			-- next js component
-- 			--w: ╰───────────── Block End ─────────────╯
--
-- 			--
-- 			--
-- 			--
-- 			--w: add snippet upper this line this is perhaps config for lua snippet
-- 			-- Optional: You might want these options
-- 			ls.config.set_config({
-- 				history = true,
--
-- 				updateevents = "TextChanged,TextChangedI",
-- 				enable_autosnippets = true,
-- 			})
--
-- 			-- Keymaps for jumping between snippet placeholders
-- 			vim.keymap.set({ "i", "s" }, "<M-h>", function()
-- 				if ls.jumpable(1) then
-- 					ls.jump(1)
-- 				end
-- 				if ls.expand_or_jumpable() then
-- 					ls.expand_or_jump()
-- 				end
-- 			end)
--
-- 			vim.keymap.set({ "i", "s" }, "<M-k>", function()
-- 				if ls.jumpable(-1) then
-- 					ls.jump(-1)
-- 				end
-- 			end)
-- 		end,
-- 	},
-- }
--
--
--

-- ~/.config/nvim/lua/sj/plugins/lua-snip.lua
return {
	{
		"L3MON4D3/LuaSnip",
		version = "v2.*",
		dependencies = {
			"rafamadriz/friendly-snippets",
			"saadparwaiz1/cmp_luasnip",
		},
		config = function()
			local ls = require("luasnip")

			-- load snippets from your folder
			require("sj.core.custom.JsTsPro.snippets.init")

			-- Basic LuaSnip settings
			ls.config.set_config({
				history = true,
				updateevents = "TextChanged,TextChangedI",
				enable_autosnippets = true,
			})

			-- keymaps for jump/expand
			vim.keymap.set({ "i", "s" }, "<M-h>", function()
				if ls.expand_or_jumpable() then
					ls.expand_or_jump()
				end
			end)
			vim.keymap.set({ "i", "s" }, "<M-k>", function()
				if ls.jumpable(-1) then
					ls.jump(-1)
				end
			end)
		end,
	},
}
```

### `lualine.lua`

```lua
return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local lualine = require("lualine")
		local lazy_status = require("lazy.status") -- to configure lazy pending updates count
		-- local scroll_mode = require("scroll_mode")
		local scroll_mode = require("sj.core.custom.CustomMode.ScrollMode")

		local colors = {
			blue = "#65D1FF",
			green = "#3EFFDC",
			violet = "#FF61EF",
			yellow = "#FFDA7B",
			red = "#FF4A4A",
			fg = "#c3ccdc",
			bg = "#112638",
			inactive_bg = "#2c3043",
		}

		local my_lualine_theme = {
			normal = {
				a = { bg = colors.blue, fg = colors.bg, gui = "bold" },
				b = { bg = colors.bg, fg = colors.fg },
				c = { bg = colors.bg, fg = colors.fg },
			},
			insert = {
				a = { bg = colors.green, fg = colors.bg, gui = "bold" },
				b = { bg = colors.bg, fg = colors.fg },
				c = { bg = colors.bg, fg = colors.fg },
			},
			visual = {
				a = { bg = colors.violet, fg = colors.bg, gui = "bold" },
				b = { bg = colors.bg, fg = colors.fg },
				c = { bg = colors.bg, fg = colors.fg },
			},
			command = {
				a = { bg = colors.yellow, fg = colors.bg, gui = "bold" },
				b = { bg = colors.bg, fg = colors.fg },
				c = { bg = colors.bg, fg = colors.fg },
			},
			replace = {
				a = { bg = colors.red, fg = colors.bg, gui = "bold" },
				b = { bg = colors.bg, fg = colors.fg },
				c = { bg = colors.bg, fg = colors.fg },
			},
			inactive = {
				a = { bg = colors.inactive_bg, fg = colors.semilightgray, gui = "bold" },
				b = { bg = colors.inactive_bg, fg = colors.semilightgray },
				c = { bg = colors.inactive_bg, fg = colors.semilightgray },
			},
		}

		-- configure lualine with modified theme
		lualine.setup({
			options = {
				theme = my_lualine_theme,
			},
			sections = {
				lualine_x = {
					{
						lazy_status.updates,
						cond = lazy_status.has_updates,
						color = { fg = "#ff9e64" },
					},

					-- <<< ADDED Scroll Mode Indicator START
					{
						function()
							return scroll_mode.active and "SCROLL" or ""
						end,
						color = { fg = colors.yellow, gui = "bold" },
						padding = { left = 1, right = 1 },
					},
					-- <<< ADDED Scroll Mode Indicator END
					{ "encoding" },
					{ "fileformat" },
					{ "filetype" },
				},
			},
		})
	end,
}
```

### `blammer.lua`

```lua
--p: b
return {
	"APZelos/blamer.nvim",
	config = function()
		vim.g.blamer_enabled = true -- Enable on startup
		vim.g.blamer_delay = 500 -- Set delay to 500ms
		vim.g.blamer_show_in_visual_modes = 0 -- Disable in visual mode
		vim.g.blamer_show_in_insert_modes = 0 -- Disable in insert mode
		vim.g.blamer_prefix = " > " -- Prefix for blame message
		vim.g.blamer_template = "<committer> <summary>" -- Customize blame template
		vim.g.blamer_date_format = "%d/%m/%y" -- Date format
		vim.g.blamer_relative_time = 1 -- Show relative time
		vim.cmd([[ highlight Blamer guifg=lightgrey ]]) -- Highlight color
	end,
}
```

### `flash.lua`

```lua
return {
	"folke/flash.nvim",
	event = "VeryLazy",
	---@type Flash.Config
	opts = {
		-- labels = "abcdefghijklmnopqrstuvwxyz",
		labels = "asdfghjklqwertyuiopzxcvbnm",
		search = {
			-- search/jump in all windows
			multi_window = true,
			-- search direction
			forward = true,
			-- when `false`, find only matches in the given direction
			wrap = true,
			---@type Flash.Pattern.Mode
			-- Each mode will take ignorecase and smartcase into account.
			-- * exact: exact match
			-- * search: regular search
			-- * fuzzy: fuzzy search
			-- * fun(str): custom function that returns a pattern
			--   For example, to only match at the beginning of a word:
			--   mode = function(str)
			--     return "\\<" .. str
			--   end,
			mode = "exact",
			-- behave like `incsearch`
			incremental = false,
			-- Excluded filetypes and custom window filters
			---@type (string|fun(win:window))[]
			exclude = {
				"notify",
				"cmp_menu",
				"noice",
				"flash_prompt",
				function(win)
					-- exclude non-focusable windows
					return not vim.api.nvim_win_get_config(win).focusable
				end,
			},
			-- Optional trigger character that needs to be typed before
			-- a jump label can be used. It's NOT recommended to set this,
			-- unless you know what you're doing
			trigger = "",
			-- max pattern length. If the pattern length is equal to this
			-- labels will no longer be skipped. When it exceeds this length
			-- it will either end in a jump or terminate the search
			max_length = false, ---@type number|false
		},
		jump = {
			-- save location in the jumplist
			jumplist = true,
			-- jump position
			pos = "start", ---@type "start" | "end" | "range"
			-- add pattern to search history
			history = false,
			-- add pattern to search register
			register = false,
			-- clear highlight after jump
			nohlsearch = false,
			-- automatically jump when there is only one match
			autojump = false,
			-- You can force inclusive/exclusive jumps by setting the
			-- `inclusive` option. By default it will be automatically
			-- set based on the mode.
			inclusive = nil, ---@type boolean?
			-- jump position offset. Not used for range jumps.
			-- 0: default
			-- 1: when pos == "end" and pos < current position
			offset = nil, ---@type number
		},
		label = {
			-- allow uppercase labels
			uppercase = true,
			-- add any labels with the correct case here, that you want to exclude
			exclude = "",
			-- add a label for the first match in the current window.
			-- you can always jump to the first match with `<CR>`
			current = true,
			-- show the label after the match
			after = true, ---@type boolean|number[]
			-- show the label before the match
			before = false, ---@type boolean|number[]
			-- position of the label extmark
			style = "overlay", ---@type "eol" | "overlay" | "right_align" | "inline"
			-- flash tries to re-use labels that were already assigned to a position,
			-- when typing more characters. By default only lower-case labels are re-used.
			reuse = "lowercase", ---@type "lowercase" | "all" | "none"
			-- for the current window, label targets closer to the cursor first
			distance = true,
			-- minimum pattern length to show labels
			-- Ignored for custom labelers.
			min_pattern_length = 0,
			-- Enable this to use rainbow colors to highlight labels
			-- Can be useful for visualizing Treesitter ranges.
			rainbow = {
				enabled = false,
				-- number between 1 and 9
				shade = 5,
			},
			-- With `format`, you can change how the label is rendered.
			-- Should return a list of `[text, highlight]` tuples.
			---@class Flash.Format
			---@field state Flash.State
			---@field match Flash.Match
			---@field hl_group string
			---@field after boolean
			---@type fun(opts:Flash.Format): string[][]
			format = function(opts)
				return { { opts.match.label, opts.hl_group } }
			end,
		},
		highlight = {
			-- show a backdrop with hl FlashBackdrop
			backdrop = true,
			-- Highlight the search matches
			matches = true,
			-- extmark priority
			priority = 5000,
			groups = {
				match = "FlashMatch",
				current = "FlashCurrent",
				backdrop = "FlashBackdrop",
				label = "FlashLabel",
			},
		},
		-- action to perform when picking a label.
		-- defaults to the jumping logic depending on the mode.
		---@type fun(match:Flash.Match, state:Flash.State)|nil
		action = nil,
		-- initial pattern to use when opening flash
		pattern = "",
		-- When `true`, flash will try to continue the last search
		continue = false,
		-- Set config to a function to dynamically change the config
		config = nil, ---@type fun(opts:Flash.Config)|nil
		-- You can override the default options for a specific mode.
		-- Use it with `require("flash").jump({mode = "forward"})`
		---@type table<string, Flash.Config>
		modes = {
			-- options used when flash is activated through
			-- a regular search with `/` or `?`
			search = {
				-- when `true`, flash will be activated during regular search by default.
				-- You can always toggle when searching with `require("flash").toggle()`
				enabled = true,
				highlight = { backdrop = false },
				jump = { history = true, register = true, nohlsearch = true },
				search = {
					-- `forward` will be automatically set to the search direction
					-- `mode` is always set to `search`
					-- `incremental` is set to `true` when `incsearch` is enabled
				},
			},
			-- options used when flash is activated through
			-- `f`, `F`, `t`, `T`, `;` and `,` motions
			char = {
				enabled = false,
				-- dynamic configuration for ftFT motions
				config = function(opts)
					-- autohide flash when in operator-pending mode
					opts.autohide = opts.autohide or (vim.fn.mode(true):find("no") and vim.v.operator == "y")

					-- disable jump labels when not enabled, when using a count,
					-- or when recording/executing registers
					opts.jump_labels = opts.jump_labels
						and vim.v.count == 0
						and vim.fn.reg_executing() == ""
						and vim.fn.reg_recording() == ""

					-- Show jump labels only in operator-pending mode
					-- opts.jump_labels = vim.v.count == 0 and vim.fn.mode(true):find("o")
				end,
				-- hide after jump when not using jump labels
				autohide = false,
				-- show jump labels
				jump_labels = false,
				-- set to `false` to use the current line only
				multi_line = true,
				-- When using jump labels, don't use these keys
				-- This allows using those keys directly after the motion
				label = { exclude = "hjkliardc" },
				-- by default all keymaps are enabled, but you can disable some of them,
				-- by removing them from the list.
				-- If you rather use another key, you can map them
				-- to something else, e.g., { [";"] = "L", [","] = H }
				keys = { "f", "F", "t", "T", ";", "," },
				---@alias Flash.CharActions table<string, "next" | "prev" | "right" | "left">
				-- The direction for `prev` and `next` is determined by the motion.
				-- `left` and `right` are always left and right.
				char_actions = function(motion)
					return {
						[";"] = "next", -- set to `right` to always go right
						[","] = "prev", -- set to `left` to always go left
						-- clever-f style
						[motion:lower()] = "next",
						[motion:upper()] = "prev",
						-- jump2d style: same case goes next, opposite case goes prev
						-- [motion] = "next",
						-- [motion:match("%l") and motion:upper() or motion:lower()] = "prev",
					}
				end,
				search = { wrap = false },
				highlight = { backdrop = true },
				jump = {
					register = false,
					-- when using jump labels, set to 'true' to automatically jump
					-- or execute a motion when there is only one match
					autojump = false,
				},
			},
			-- options used for treesitter selections
			-- `require("flash").treesitter()`
			treesitter = {
				labels = "abcdefghijklmnopqrstuvwxyz",
				jump = { pos = "range", autojump = true },
				search = { incremental = false },
				label = { before = true, after = true, style = "inline" },
				highlight = {
					backdrop = false,
					matches = false,
				},
			},
			treesitter_search = {
				jump = { pos = "range" },
				search = { multi_window = true, wrap = true, incremental = false },
				remote_op = { restore = true },
				label = { before = true, after = true, style = "inline" },
			},
			-- options used for remote flash
			remote = {
				remote_op = { restore = true, motion = true },
			},
		},
		-- options for the floating window that shows the prompt,
		-- for regular jumps
		-- `require("flash").prompt()` is always available to get the prompt text
		prompt = {
			enabled = true,
			prefix = { { "⚡", "FlashPromptIcon" } },
			win_config = {
				relative = "editor",
				width = 1, -- when <=1 it's a percentage of the editor width
				height = 1,
				row = -1, -- when negative it's an offset from the bottom
				col = 0, -- when negative it's an offset from the right
				zindex = 1000,
			},
		},
		-- options for remote operator pending mode
		remote_op = {
			-- restore window views and cursor position
			-- after doing a remote operation
			restore = false,
			-- For `jump.pos = "range"`, this setting is ignored.
			-- `true`: always enter a new motion when doing a remote operation
			-- `false`: use the window's cursor position and jump target
			-- `nil`: act as `true` for remote windows, `false` for the current window
			motion = false,
		},
	},
  -- stylua: ignore
  keys = {
    { "f",      mode = { "n", "x", "t", "o" }, function() require("flash").jump() end,              desc = "Flash" },
    { "<M-k>", mode = { "i" },                function() require("flash").jump() end,              desc = "Flash" },
    { "S",      mode = { "n", "x", "o" },      function() require("flash").treesitter() end,        desc = "Flash Treesitter" },
    { "r",      mode = "o",                    function() require("flash").remote() end,            desc = "Remote Flash" },
    { "R",      mode = { "o", "x" },           function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
    { "<c-s>",  mode = { "c" },                function() require("flash").toggle() end,            desc = "Toggle Flash Search" },

    --w:  jump url   with flash hints
    {
      "<leader>uh",
      mode = { "n", "x", "o" },
      function()
        require("flash").jump({
          pattern = [[https\?://\S\+]], -- direct pattern, not prompted
          search = {
            mode = "search",
            multi_window = true, -- or true if you want all windows
            incremental = false,
          },
          label = {
            after = true,
            before = false,
            style = "inline",
          },
          highlight = {
            matches = true,
            backdrop = true,
          },
        })
      end,
      desc = "Flash Jump to URLs",
    },
    --w: jump url  and browser open without focus to the url
    {
      "<leader>ud",
      mode = { "n", "x", "o" },
      function()
        require("flash").jump({
          pattern = [[https\?://\S\+]],
          search = { mode = "search", incremental = false },
          action = function(match)
            local line = vim.fn.getline(match.pos[1])
            -- Extract URL and clean common trailing chars
            local url = string.match(line, "https?://[%S]+", match.pos[2])
            if url then
              -- Remove trailing punctuation that's likely not part of URL
              url = string.gsub(url, '[")};,]+$', '')
              vim.notify("Opening: " .. url)
              vim.fn.jobstart({ "xdg-open", url }, { detach = true })
            end
          end,
        })
      end,
      desc = "Flash jump and open URL",
    },
    --w: jump url  and browser open and focus that url
    {
      "<leader>uo",
      mode = { "n", "x", "o" },
      function()
        require("flash").jump({
          pattern = [[https\?://\S\+]],
          search = { mode = "search", incremental = false },
          action = function(match)
            -- Move cursor to the URL position
            vim.api.nvim_win_set_cursor(0, { match.pos[1], match.pos[2] - 1 })

            local line = vim.fn.getline(match.pos[1])
            local url = string.match(line, "https?://[%S]+", match.pos[2])
            if url then
              url = string.gsub(url, '[")};,]+$', '')
              vim.notify("Opening: " .. url)
              vim.fn.jobstart({ "xdg-open", url }, { detach = true })
            end
          end,
        })
      end,
      desc = "Flash jump to URL and open",
    },



    {
      "<leader>ut",
      mode = { "n", "x", "o" },
      function()
        require("flash").jump({
          pattern = [[eyJ[A-Za-z0-9_\-]\+\.[A-Za-z0-9_\-]\+\.[A-Za-z0-9_\-]\+]],
          search = {
            mode = "search",
            multi_window = true,
            incremental = false,
          },
          label = { after = true, style = "inline" },
          highlight = { matches = true, backdrop = true },
          action = function(match)
            -- Move cursor precisely to match start
            vim.api.nvim_win_set_cursor(0, { match.pos[1], match.pos[2] - 1 })

            -- Get the line under cursor
            local line = vim.fn.getline(".")
            -- Capture the token starting from cursor (robust even if spacing weird)
            local token = line:match("eyJ[%w%-_]+%.[%w%-_]+%.[%w%-_]+")

            if token and #token > 0 then
              vim.fn.setreg('"', token)
              vim.fn.setreg('+', token)
              vim.notify("🔑 Yanked access token: " .. token:sub(1, 10) .. "...", vim.log.levels.INFO)
            else
              vim.notify("No token found", vim.log.levels.WARN)
            end
          end,
        })
      end,
      desc = "Flash hint and yank JWT access token",
    },

  },
}
```

### `gh.lua`

```lua
return {
	-- gh.nvim configuration
	{
		"ldelossa/gh.nvim",
		dependencies = {
			{ "ldelossa/litee.nvim" }, -- Required dependency for gh.nvim
		},
		config = function()
			-- Load litee.nvim (required)
			require("litee.lib").setup()
			-- Load gh.nvim
			require("litee.gh").setup({
				-- Optional: Customize options here
				keymaps = {
					-- Example of default key bindings
					open = "o", -- Open issue/PR details
					close = "q", -- Close current window
					next = "n", -- Go to next issue/PR
					prev = "p", -- Go to previous issue/PR
					comment = "c", -- Add a comment
					approve = "a", -- Approve a PR
					request_changes = "r", -- Request changes
				},
			})
			-- Example of key mappings for gh.nvim commands
			vim.keymap.set("n", "<leader>gi", ":GHIssues<CR>", { desc = "List GitHub Issues" })
			vim.keymap.set("n", "<leader>gp", ":GHPulls<CR>", { desc = "List GitHub Pull Requests" })
			vim.keymap.set("n", "<leader>gr", ":GHRepo<CR>", { desc = "View GitHub Repository" })
			vim.keymap.set("n", "<leader>gn", ":GHNotifications<CR>", { desc = "List GitHub Notifications" })
		end,
	},
}
--
```

### `which-key.lua`

```lua
return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 500
	end,
	opts = {
		-- your configuration comes here
		-- or leave it empty to use the default settings
		-- refer to the configuration section below
	},
}
```

### `noice.lua`

```lua
-- Filename: /home/krishna/github/dotfiles-latest/nvim-lazyvim/lua/plugins/noice.lua
-- I want to change the default notifications to be less obtrussive (if that's even a word)
-- https://github.com/folke/noice.nvim

return {
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		-- enabled = false,
		opts = {
			presets = {
				-- This is the search bar or popup that shows up when you press /
				-- Setting this to false makes it a popup and true the search bar at the bottom
				bottom_search = false,
			},
			messages = {
				-- NOTE: If you enable messages, then the cmdline is enabled automatically.
				-- This is a current Neovim limitation.
				enabled = true, -- enables the Noice messages UI
				view = "mini", -- default view for messages
				view_error = "mini", -- view for errors
				view_warn = "mini", -- view for warnings
				view_history = "mini", -- view for :messages
				view_search = "mini", -- view for search count messages. Set to `false` to disable
			},
			notify = {
				-- Noice can be used as `vim.notify` so you can route any notification like other messages
				-- Notification messages have their level and other properties set.
				-- event is always "notify" and kind can be any log level as a string
				-- The default routes will forward notifications to nvim-notify
				-- Benefit of using Noice for this is the routing and consistent history view
				enabled = true,
				view = "mini",
			},
			lsp = {
				message = {
					-- Messages shown by lsp servers
					enabled = true,
					view = "mini",
				},
			},
			views = {
				-- This sets the position for the search popup that shows up with / or with :
				cmdline_popup = {
					position = {
						row = "40%",
						col = "50%",
					},
				},
				mini = {
					timeout = 7000, -- timeout in milliseconds
					align = "center",
					position = {
						-- Centers messages top to bottom
						row = "95%",
						-- Aligns messages to the far right
						col = "100%",
					},
				},
			},
		},
	},
}
```

### `gx.lua`

```lua
-- Optional mappings (customize as needed)
vim.keymap.set("n", "gxx", "<esc>:URLOpenUnderCursor<cr>")
vim.keymap.set("n", "gxh", "<esc>:URLOpenHighlightAll<cr>")
vim.keymap.set("n", "gxl", "<esc>:URLOpenHighlightAllClear<cr>")
return {
	"sontungexpt/url-open",
	event = "VeryLazy",
	cmd = "URLOpenUnderCursor",
	config = function()
		local status_ok, url_open = pcall(require, "url-open")
		if not status_ok then
			return
		end
		url_open.setup({})
	end,
}
```

### `fzf-lua.lua`

```lua
-- return {
-- 	"ibhagwan/fzf-lua",
-- 	requires = "nvim-lua/plenary.nvim",
-- 	config = function()
-- 		require("fzf-lua").setup({})
--
-- 		vim.keymap.set("n", "<leader>ag", function()
-- 			-- Run `gh repo list` to fetch repositories and use fzf-lua for selection
-- 			local repos =
-- 				vim.fn.systemlist("gh repo list Apollo-Level2-Web-Dev --json name --jq '.[].name' --limit 200")
-- 			if #repos == 0 then
-- 				print("No repositories found.")
-- 				return
-- 			end
--
-- 			-- Use fzf-lua to select a repository
-- 			require("fzf-lua").fzf_exec(repos, {
-- 				prompt = "Select a repo: ",
-- 				actions = {
-- 					-- Default action: Copy repo name to clipboard
-- 					["default"] = function(selected)
-- 						vim.fn.system("echo -n " .. selected[1] .. " | xclip -selection clipboard")
-- 					end,
-- 					-- Ctrl-o: Open the repo in the browser
-- 					["ctrl-o"] = function(selected)
-- 						vim.fn.system("gh repo view Apollo-Level2-Web-Dev/" .. selected[1] .. " --web")
-- 					end,
-- 					-- Ctrl-r: Clone the selected repo
-- 					["ctrl-r"] = function(selected)
-- 						vim.fn.system("git clone https://github.com/Apollo-Level2-Web-Dev/" .. selected[1])
-- 					end,
-- 				},
-- 			})
-- 		end, { desc = "Open GitHub Repo Manager" })
-- 	end,
-- }
--t: below added for running zsh history command

return {
	"ibhagwan/fzf-lua",
	requires = "nvim-lua/plenary.nvim",
	config = function()
		require("fzf-lua").setup({})

		-- Existing GitHub Repo Manager functionality
		vim.keymap.set("n", "<leader>ag", function()
			-- Run `gh repo list` to fetch repositories and use fzf-lua for selection
			local repos =
				vim.fn.systemlist("gh repo list Apollo-Level2-Web-Dev --json name --jq '.[].name' --limit 200")
			if #repos == 0 then
				print("No repositories found.")
				return
			end

			-- Use fzf-lua to select a repository
			require("fzf-lua").fzf_exec(repos, {
				prompt = "Select a repo: ",
				actions = {
					-- Default action: Copy repo name to clipboard
					["default"] = function(selected)
						vim.fn.system("echo -n " .. selected[1] .. " | xclip -selection clipboard")
					end,
					-- Ctrl-o: Open the repo in the browser
					["ctrl-o"] = function(selected)
						vim.fn.system("gh repo view Apollo-Level2-Web-Dev/" .. selected[1] .. " --web")
					end,
					-- Ctrl-r: Clone the selected repo
					["ctrl-r"] = function(selected)
						vim.fn.system("git clone https://github.com/Apollo-Level2-Web-Dev/" .. selected[1])
					end,
				},
			})
		end, { desc = "Open GitHub Repo Manager" })

		-- Zsh History functionality with tmux pane number prompt
		vim.keymap.set("n", "<leader>ch", function()
			-- Read Zsh history from the file
			local history_file = vim.fn.expand("~/.zsh_history")
			local history = vim.fn.readfile(history_file)

			if #history == 0 then
				print("No command history found.")
				return
			end

			-- Prompt for tmux pane number
			local pane_number = vim.fn.input("Enter tmux pane number: ")
			if pane_number == "" then
				print("No pane number provided.")
				return
			end

			-- Use fzf-lua to select a Zsh command
			require("fzf-lua").fzf_exec(history, {
				prompt = "Select Zsh command: ",
				actions = {
					-- Default action: Run the selected command in the specified tmux pane
					["default"] = function(selected)
						local command = selected[1]
						-- Send the command to the selected tmux pane
						vim.fn.system("tmux send-keys -t " .. pane_number .. " '" .. command .. "' C-m")
						print("Running: " .. command .. " in pane " .. pane_number)
					end,
				},
			})
		end, { desc = "Run command from Zsh history in tmux pane" })
	end,
}
```

### `bufferline.lua`

```lua
return {
  "akinsho/bufferline.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  version = "*",
  opts = {
    options = {
      mode = "tabs",
      separator_style = "slant",
    },
  },
}
```
