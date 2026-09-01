return {
	"ChuYanLon/telegram.nvim",
	build = "npm i",
	event = "VeryLazy",
	keys = {
		{ "<leader>tt", "<cmd>Tg<Cr>", desc = "Toggle Telegram" },
		{ "<leader>tL", "<cmd>TgLogout<Cr>", desc = "Logout Telegram" },
	},
	cmd = { "Tg", "TgLogout" },
	opts = {
		-- tdlib_path = "/path/to/libtdjson.so", -- only if auto-detection fails
		-- proxy = "socks5://127.0.0.1:7890",     -- only if Telegram is blocked in your region
	},
}
