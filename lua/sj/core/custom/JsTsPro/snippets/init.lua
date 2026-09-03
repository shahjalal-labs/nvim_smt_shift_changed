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

local js_ts_filetypes = { "javascript", "typescript", "javascriptreact", "typescriptreact" }
local react_filetypes = { "javascriptreact", "typescriptreact", "javascript", "typescript" }
local ts_filetypes = { "typescript", "typescriptreact" }

for _, ft in ipairs(js_ts_filetypes) do
	safe_load(ft, "sj.core.custom.JsTsPro.snippets.javascript")
end

for _, ft in ipairs(react_filetypes) do
	safe_load(ft, "sj.core.custom.JsTsPro.snippets.react")
end

for _, ft in ipairs(ts_filetypes) do
	safe_load(ft, "sj.core.custom.JsTsPro.snippets.typescript")
end

safe_load("html", "sj.core.custom.JsTsPro.snippets.html")
