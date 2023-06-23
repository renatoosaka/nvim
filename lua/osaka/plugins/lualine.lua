local status, lualine = pcall(require, "lualine")
if not status then
	return
end

lualine.setup({
	options = {
		theme = "tokyonight",
		icons_enabled = true,
		component_separators = "|",
		section_separators = "",
		disabled_filetypes = {
			"packer",
			"NvimTree",
		},
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = { "branch" },
		lualine_c = {
			{
				"buffers",
				mode = 0,
				-- 1: Shows buffer index
				-- 2: Shows buffer name + buffer index
				-- 3: Shows buffer number
				-- 4: Shows buffer name + buffer number

				max_length = vim.o.columns * 2 / 3, -- Maximum width of buffers component,
				-- it can also be a function that returns
				-- the value of `max_length` dynamically.
				filetype_names = {
					TelescopePrompt = "Telescope",
					dashboard = "Dashboard",
					fzf = "FZF",
					alpha = "Alpha",
				}, --

				-- Automatically updates active buffer color to match color of other components (will be overidden if buffers_color is set)
				use_mode_colors = false,

				buffers_color = {
					-- Same values as the general color option can be used here.
					active = { fg = "#fafafa", bg = "#3d59a1" }, -- Color for active buffer.
					inactive = { fg = "#c0caf5", bg = "NONE" }, -- Color for inactive buffers.
				},

				symbols = {
					modified = " ●", -- Text to show when the buffer is modified
					alternate_file = "", -- Text to show to identify the alternate file
					directory = "", -- Text to show when the buffer is a directory
				},
			},
		},
		-- lualine_c = {
		-- 	{ "filename", file_status = false, path = 1 },
		-- },
	},
})
