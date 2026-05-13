## 🌲 Full Project Structure (cwd)

```bash
/home/sj/.config/nvim
├── init.lua
├── lazy-lock.json
├── lua
│   └── sj
│       ├── core
│       │   ├── custom
│       │   │   ├── ai
│       │   │   │   ├── createPrompt
│       │   │   │   │   ├── init.lua
│       │   │   │   │   ├── job.lua
│       │   │   │   │   └── non_coding
│       │   │   │   │       ├── init.lua
│       │   │   │   │       ├── markdown_image_note.lua
│       │   │   │   │       └── wordExplain.lua
│       │   │   │   ├── init.lua
│       │   │   │   └── module_content_combiner.lua
│       │   │   ├── checking2.lua
│       │   │   ├── checking-feature.lua
│       │   │   ├── coding_specific
│       │   │   │   ├── code_explorer.lua
│       │   │   │   └── init.lua
│       │   │   ├── CustomMode
│       │   │   │   ├── init.lua
│       │   │   │   ├── ScrollMode.lua
│       │   │   │   └── surfingKeys.lua
│       │   │   ├── Git
│       │   │   │   ├── autoPush2.lua
│       │   │   │   ├── autoPush.lua
│       │   │   │   ├── clone.lua
│       │   │   │   ├── Github
│       │   │   │   │   ├── github2.lua
│       │   │   │   │   ├── github.lua
│       │   │   │   │   └── init.lua
│       │   │   │   ├── githubDescription.lua
│       │   │   │   ├── githubRepo
│       │   │   │   │   └── gitRepoGeneratePush.lua
│       │   │   │   ├── githubRepoGenerateAndPush.lua
│       │   │   │   ├── init.lua
│       │   │   │   ├── readmeGen2.lua
│       │   │   │   ├── readmeGenerate.lua
│       │   │   │   └── smartCopyPaste.lua
│       │   │   ├── HttpApiTesting
│       │   │   │   ├── init.lua
│       │   │   │   └── rest_commands.lua
│       │   │   ├── init.lua
│       │   │   ├── insertMode.lua
│       │   │   ├── JsTsPro
│       │   │   │   ├── init.lua
│       │   │   │   ├── jsTs2.lua
│       │   │   │   ├── jsTs.lua
│       │   │   │   ├── jsxPro2.lua
│       │   │   │   ├── jsxPro.lua
│       │   │   │   ├── jwt_decode.lua
│       │   │   │   ├── reBuildModule.lua
│       │   │   │   └── snippets
│       │   │   │       ├── html.lua
│       │   │   │       ├── init.lua
│       │   │   │       ├── javascript.lua
│       │   │   │       ├── react.lua
│       │   │   │       └── typescript.lua
│       │   │   ├── normalModeInInrsert.lua
│       │   │   ├── others.lua
│       │   │   ├── pane_window
│       │   │   │   ├── init.lua
│       │   │   │   └── pane.lua
│       │   │   └── TmuxZshCli
│       │   │       ├── build.lua
│       │   │       ├── fileUtils
│       │   │       │   ├── fileNavigate.lua
│       │   │       │   ├── file_navigation
│       │   │       │   │   ├── init.lua
│       │   │       │   │   ├── navigate_to_controller.lua
│       │   │       │   │   ├── navigate_to_routes.lua
│       │   │       │   │   └── navigate_to_service.lua
│       │   │       │   ├── fileOperation.lua
│       │   │       │   ├── init.lua
│       │   │       │   └── module_files_creation.lua
│       │   │       ├── init.lua
│       │   │       ├── Terminal
│       │   │       │   ├── init.lua
│       │   │       │   └── nvimTerminal.lua
│       │   │       ├── tmuxCommandSender.lua
│       │   │       ├── tmuxPaneContent.lua
│       │   │       ├── tmuxZsh2.lua
│       │   │       └── tmuxZsh.lua
│       │   ├── init.lua
│       │   ├── keymaps.lua
│       │   ├── options.lua
│       │   └── utils.lua
│       ├── lazy.lua
│       └── plugins
│           ├── alpha.lua
│           ├── autopairs.lua
│           ├── autoSave.lua
│           ├── auto-session.lua
│           ├── blammer.lua
│           ├── bufferline.lua
│           ├── colorful-winsep.lua
│           ├── colorscheme.lua
│           ├── comfy-line-numbers.lua
│           ├── comment.lua
│           ├── copilotChat.lua
│           ├── cursor-line.lua
│           ├── dad_bod.lua
│           ├── dbee.lua
│           ├── dressing.lua
│           ├── emoji.lua
│           ├── error-lens.lua
│           ├── flash.lua
│           ├── formatting.lua
│           ├── fzf-lua.lua
│           ├── gh.lua
│           ├── gitsigns.lua
│           ├── grugFar.lua
│           ├── gx.lua
│           ├── hl_match.lua
│           ├── hop.lua
│           ├── hurl.lua
│           ├── image.lua
│           ├── indent-blankline.lua
│           ├── init.lua
│           ├── kulala.lua
│           ├── lazygit.lua
│           ├── linting.lua
│           ├── logsitter.lua
│           ├── lsp
│           │   ├── lspconfig.lua
│           │   └── mason.lua
│           ├── lualine.lua
│           ├── lua-snip.lua
│           ├── mason-workaround.lua
│           ├── md-pdf.lua
│           ├── multi-cursor.lua
│           ├── neoscroll.lua
│           ├── neotree.lua
│           ├── noice.lua
│           ├── nvim-cmp.lua
│           ├── nvim-tree.lua
│           ├── rainbow-matching.lua
│           ├── smearCursor.lua
│           ├── snacks.lua
│           ├── super_maven.lua
│           ├── surround.lua
│           ├── tailwind.lua
│           ├── tailwind-tools.lua
│           ├── telescope.lua
│           ├── tiny_glimmer.lua
│           ├── todo-comments.lua
│           ├── treesitter.lua
│           ├── trouble.lua
│           ├── twilight.lua
│           ├── vim-maximizer.lua
│           ├── web_socket.lua
│           ├── web-tools.lua
│           ├── which-key.lua
│           ├── winshift.lua
│           ├── yanky.lua
│           └── yazi.lua
├── nvim_note.md
├── README.md
└── structure.md

23 directories, 139 files
```

## 📁 Target Module Tree (snippets)

```bash
/home/sj/.config/nvim/lua/sj/core/custom/JsTsPro/snippets
├── html.lua
├── init.lua
├── javascript.lua
├── react.lua
└── typescript.lua

1 directory, 5 files
```

-- ~/.config/nvim/lua/sj/plugins/lua-snip.lua
return {
{
"L3MON4D3/LuaSnip",
version = "v2.\*",
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

## 📄 Module Files & Contents

### `init.lua`

```lua
local ls = require("luasnip")

local function safe_load(ft, path)
	local ok, snippets = pcall(require, path)
	if ok then
		ls.add_snippets(ft, snippets)
	else
		vim.notify("Failed to load snippets: " .. path, vim.log.levels.WARN)
	end
end

-- load snippets

local filetypes = { "javascript", "typescript", "javascriptreact", "typescriptreact" }

for _, ft in ipairs(filetypes) do
	safe_load(ft, "sj.core.custom.JsTsPro.snippets.javascript")
end

safe_load("html", "sj.core.custom.JsTsPro.snippets.html")
```

### `typescript.lua`

```lua
local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
	-- Type definition snippet
	s("ttype", {
		t("type T"),
		i(1, "Name"),
		t(" = {"),
		i(0),
		t("}"),
	}),

	-- Interface snippet
	s("u", {
		t("interface I"),
		i(1, "Name"),
		t({ " {", "    " }),
		i(0),
		t({ "", "}" }),
	}),
}
```

### `javascript.lua`

```lua
local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local fmt = require("luasnip.extras.fmt").fmt

return {
	-- Arrow function snippet for JavaScript
	s(
		"af",
		fmt(
			[[
const {} = {}({}) => {{
  {}
}};
]],
			{
				i(1, ""),
				c(2, { t(""), t("async ") }),
				i(3, "params"),
				i(4, ""),
			}
		)
	),

	-- Page snippet for JavaScript (from your large file)
	s("d", {
		t("const "),
		f(function(_, snip)
			local dir = snip.env.TM_DIRECTORY
			local parent = dir:match(".*/([^/]+)/%[.-%]$")
			local function pascal_case(str)
				return (str:gsub("(%a)(%w*)", function(a, b)
					return a:upper() .. b:lower()
				end))
			end
			return parent and pascal_case(parent) .. "Details" or "ComponentDetails"
		end, {}),
		t(" = async ({ params }) => {"),
		t({ "", "  const p = await params;" }),
		t({ "", "  console.log(p." }),
		f(function(_, snip)
			local dir = snip.env.TM_DIRECTORY
			local param = dir:match(".*/%[(.-)%]$")
			return param or "id"
		end, {}),
		t({ ', "dynamicId in params", 3);', "", "", "  return (", "    <div>", "      " }),
		f(function(_, snip)
			local dir = snip.env.TM_DIRECTORY
			local parent = dir:match(".*/([^/]+)/%[.-%]$")
			local function pascal_case(str)
				return (str:gsub("(%a)(%w*)", function(a, b)
					return a:upper() .. b:lower()
				end))
			end
			return parent and pascal_case(parent) .. "Details" or "ComponentDetails"
		end, {}),
		i(0),
		t({ "</h2>", "    </div>", "  );", "};", "", "export default " }),
		f(function(_, snip)
			local dir = snip.env.TM_DIRECTORY
			local parent = dir:match(".*/([^/]+)/%[.-%]$")
			local function pascal_case(str)
				return (str:gsub("(%a)(%w*)", function(a, b)
					return a:upper() .. b:lower()
				end))
			end
			return parent and pascal_case(parent) .. "Details" or "ComponentDetails"
		end, {}),
		t(";"),
	}),
}
```

### `html.lua`

```lua
local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
	s("h", {
		t({
			"<!doctype html>",
			'<html lang="en">',
			"  <head>",
			'    <meta charset="UTF-8" />',
			'    <meta name="viewport" content="width=device-width, initial-scale=1.0" />',
			"    <title>",
		}),
		i(1),
		t({ "</title>", '    <link rel="stylesheet" href="' }),
		i(2),
		t({ '" />', "  </head>", "  <body>" }),
		i(3),
		t({ "  </body>", "</html>" }),
	}),
}
```

### `react.lua`

```lua
local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node

local filetypes = {
	"javascriptreact",
	"typescriptreact",
}

local react_component = s("b", {
	t({ "const " }),
	f(function()
		return vim.fn.expand("%:t:r")
	end, {}),
	t(" = () => {"),
	t({ "  return (", "    <div>", "      " }),
	i(1, ""),
	t({ "", "    </div>", "  );", "};", "", "export default " }),
	f(function()
		return vim.fn.expand("%:t:r")
	end, {}),
	t(";"),
})

local arrow_component = s("a", {
	t({ "const " }),
	f(function()
		return vim.fn.expand("%:t:r")
	end, {}),
	t({ " = () => {", "  return (", "    <>" }),
	i(1, ""),
	t({ "", "    </>", "  );", "};", "", "export default " }),
	f(function()
		return vim.fn.expand("%:t:r")
	end, {}),
	t(";"),
})

return { react_component, arrow_component }
```
