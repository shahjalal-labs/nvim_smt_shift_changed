-- Decode JWT token from clipboard
local function decode_jwt()
	-- Get clipboard content
	local jwt = vim.fn.getreg("+")
	if jwt == "" then
		jwt = vim.fn.getreg("*")
	end

	if jwt == "" then
		vim.notify("Clipboard is empty!", vim.log.levels.WARN)
		return
	end

	-- Extract payload part (second part of JWT)
	local parts = {}
	for part in jwt:gmatch("[^.]+") do
		table.insert(parts, part)
	end

	if #parts < 2 then
		vim.notify("Invalid JWT token format", vim.log.levels.ERROR)
		return
	end

	local payload = parts[2]

	-- Add padding if needed and decode base64
	local padding = (#payload % 4 == 0) and "" or string.rep("=", 4 - (#payload % 4))
	payload = payload .. padding

	local decoded = vim.fn.system('echo "' .. payload .. '" | base64 -d 2>/dev/null')

	if decoded == "" then
		vim.notify("Failed to decode JWT", vim.log.levels.ERROR)
		return
	end

	-- Format JSON if jq is available
	local formatted = vim.fn.system("echo '" .. decoded .. "' | jq . 2>/dev/null")

	if formatted ~= "" and vim.v.shell_error == 0 then
		decoded = formatted
	end

	----------------------------------------------------------------
	-- JWT time information
	----------------------------------------------------------------

	-- Extract iat and exp from decoded JSON
	local iat = decoded:match('"iat"%s*:%s*(%d+)')
	local exp = decoded:match('"exp"%s*:%s*(%d+)')

	local time_info = {}

	if iat and exp then
		iat = tonumber(iat)
		exp = tonumber(exp)

		local now = os.time()

		------------------------------------------------------------
		-- Format timestamp
		------------------------------------------------------------

		local function format_time(timestamp)
			return os.date("%b %d, %Y %I:%M %p", timestamp)
		end

		------------------------------------------------------------
		-- Format duration
		------------------------------------------------------------

		local function format_duration(seconds)
			seconds = math.max(0, seconds)

			local days = math.floor(seconds / 86400)
			local hours = math.floor((seconds % 86400) / 3600)
			local minutes = math.floor((seconds % 3600) / 60)

			if days > 0 then
				if hours > 0 then
					return string.format("%d days, %d hours", days, hours)
				end

				return string.format("%d days", days)
			elseif hours > 0 then
				if minutes > 0 then
					return string.format("%d hours, %d minutes", hours, minutes)
				end

				return string.format("%d hours", hours)
			elseif minutes > 0 then
				return string.format("%d minutes", minutes)
			else
				return "less than a minute"
			end
		end

		------------------------------------------------------------
		-- Calculate JWT status
		------------------------------------------------------------

		local duration = exp - iat
		local status
		local difference

		if now < exp then
			status = "ACTIVE"
			difference = exp - now
		else
			status = "EXPIRED"
			difference = now - exp
		end

		------------------------------------------------------------
		-- Build time information block
		------------------------------------------------------------

		table.insert(time_info, "")
		table.insert(time_info, "Issued At : " .. format_time(iat))
		table.insert(time_info, "Expires   : " .. format_time(exp))
		table.insert(time_info, "Duration  : " .. format_duration(duration))

		if status == "ACTIVE" then
			table.insert(time_info, "Remaining : " .. format_duration(difference))
		else
			table.insert(time_info, "Expired   : " .. format_duration(difference) .. " ago")
		end

		table.insert(time_info, "Status    : " .. status)
	end

	----------------------------------------------------------------
	-- Create temporary buffer
	----------------------------------------------------------------

	local buf = vim.api.nvim_create_buf(false, true)

	vim.api.nvim_buf_set_name(buf, "JWT_Decoded_" .. os.time())

	-- Buffer options
	vim.api.nvim_buf_set_option(buf, "bufhidden", "wipe")
	vim.api.nvim_buf_set_option(buf, "buftype", "nofile")
	vim.api.nvim_buf_set_option(buf, "swapfile", false)

	----------------------------------------------------------------
	-- Open vertical split
	----------------------------------------------------------------

	vim.cmd("vsplit")
	vim.api.nvim_win_set_buf(0, buf)

	----------------------------------------------------------------
	-- Set decoded JSON
	----------------------------------------------------------------

	local lines = vim.split(decoded, "\n")

	-- Remove trailing empty line from jq output
	if lines[#lines] == "" then
		table.remove(lines, #lines)
	end

	----------------------------------------------------------------
	-- Append JWT time information
	----------------------------------------------------------------

	for _, line in ipairs(time_info) do
		table.insert(lines, line)
	end

	vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)

	----------------------------------------------------------------
	-- Buffer configuration
	----------------------------------------------------------------

	vim.api.nvim_buf_set_option(buf, "filetype", "json")

	-- Readonly
	vim.api.nvim_buf_set_option(buf, "readonly", true)
	vim.api.nvim_buf_set_option(buf, "modifiable", false)

	----------------------------------------------------------------
	-- Close buffer with q
	----------------------------------------------------------------

	vim.keymap.set("n", "q", ":close<CR>", {
		buffer = buf,
		noremap = true,
		silent = true,
	})

	vim.notify("JWT decoded successfully! Press 'q' to close.")
end

----------------------------------------------------------------
-- Keymap
----------------------------------------------------------------

vim.keymap.set("n", "<leader>dj", decode_jwt, {
	desc = "Decode JWT from clipboard",
})
