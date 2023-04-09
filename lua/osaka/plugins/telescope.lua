local telescope_status, telescope = pcall(require, "telescope")
if not telescope_status then
	return
end

local actions_status, actions = pcall(require, "telescope.actions")
if not actions_status then
	return
end

telescope.setup({
	defaults = {
		mappings = {
			i = {
				["<C-k>"] = actions.move_selection_previous, -- move to previous result
				["<C-j>"] = actions.move_selection_next, -- move to next result
				["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist, -- send selected to quick fix list
			},
		},
	},
})

telescope.load_extension("fzf")
telescope.load_extension("lazygit")
