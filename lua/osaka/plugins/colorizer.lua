local status, colorizer = pcall(require, "colorizer")
if not status then
	return
end

colorizer.setup({
	filetypes = { "*" },
	user_default_options = {
		css = true,
		css_fn = true,
		mode = "background",
		tailwind = true,
		sass = { enabled = true, parsers = { "css" } },
	},
})
