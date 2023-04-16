local status, lualine = pcall(require, "lualine")
if not status then
	return
end

lualine.setup({
	options = {
		theme = "tokyonight",
	},
	sections = {
		lualine_c = {
			{ "filename", file_status = false, path = 1 },
		},
	},
})
