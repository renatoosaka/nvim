local status, _ = pcall(vim.cmd, "colorscheme tokyonight")
if not status then
	print("Color scheme not found")
	return
end

-- local status, colorscheme = pcall(require, "github-theme")
-- if not status then
-- 	return
-- end
--
-- colorscheme.setup({
-- 	theme_style = "dark",
--   colors = {
--     syntax = {
-- 	  	string = "#fafafa",
--   	},
--   }
-- })
