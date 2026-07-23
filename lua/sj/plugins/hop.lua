--[[ return {
	"phaazon/hop.nvim",
	enabled = false, -- <-- add this
	branch = "v2",
	config = function()
		-- you can configure Hop the way you like here; see :h hop-config
		require("hop").setup({ keys = "etovxqpdygfblzhckisuran" })
	end,
} ]]

return {
	"smoka7/hop.nvim",
	version = "*",
	opts = {
		keys = "etovxqpdygfblzhckisuran",
	},
}
