local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer() -- true if packer was just installed

-- Autocommand that reloads neovim whenever you save this file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
  augroup end
]])

local status, packer = pcall(require, "packer")
if not status then
	return
end

return packer.startup(function(use)
	use("wbthomason/packer.nvim")

	use("nvim-lua/plenary.nvim") -- lua functions that many plugins use
	--use("bluz71/vim-nightfly-guicolors") -- colorscheme
	--use({ "projekt0n/github-nvim-theme", tag = "v0.0.7" })
	use("folke/tokyonight.nvim")
	use("christoomey/vim-tmux-navigator") -- tmux & split windo nagigator
	use("szw/vim-maximizer") -- maximizes and restores current window
	use("tpope/vim-surround") -- add, delete, change surroundings
	use("vim-scripts/ReplaceWithRegister") -- replace with register contents using motion (gr + motion)
	use("numToStr/Comment.nvim") -- commenting with gc
	use("nvim-tree/nvim-tree.lua") -- file explorer
	use("kyazdani42/nvim-web-devicons") -- icons
	use("nvim-lualine/lualine.nvim") -- status line
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" }) -- dependency for better sorting performance
	use({ "nvim-telescope/telescope.nvim", branch = "0.1.x" }) -- fuzzy finder

	use("hrsh7th/nvim-cmp") -- completion plugin
	use("hrsh7th/cmp-buffer") -- source for text in buffer
	use("hrsh7th/cmp-path") -- source for file system paths
	use("hrsh7th/cmp-nvim-lsp-signature-help") -- source for file system paths

	-- snippets
	use("L3MON4D3/LuaSnip") -- snippet engineuse
	use("saadparwaiz1/cmp_luasnip") -- for autocompletion
	use("rafamadriz/friendly-snippets") -- useful snippets

	use("williamboman/mason.nvim") -- in charge of managing lsp servers, linters & formatters
	use("williamboman/mason-lspconfig.nvim") -- bridges gap b/w mason & lspconfig
	use("neovim/nvim-lspconfig") -- easily configure language servers
	use("hrsh7th/cmp-nvim-lsp") -- for autocompletion
	use({
		"glepnir/lspsaga.nvim",
		branch = "main",
		requires = {
			{ "nvim-tree/nvim-web-devicons" },
			{ "nvim-treesitter/nvim-treesitter" },
		},
	}) -- enhanced lsp uis
	use("jose-elias-alvarez/typescript.nvim") -- additional functionality for typescript server (e.g. rename file & update imports)
	use("onsails/lspkind.nvim") -- vs-code like icons for autocompletion

	-- formatting & linting
	use("jose-elias-alvarez/null-ls.nvim") -- configure formatters & linters
	use("jayp0521/mason-null-ls.nvim") -- bridges gap b/w mason & null-ls

	-- treesitter configuration
	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
			ts_update()
		end,
	})

	-- auto closing
	use("windwp/nvim-autopairs") -- autoclose parens, brackets, quotes, etc...
	use({ "windwp/nvim-ts-autotag", after = "nvim-treesitter" }) -- autoclose tags

	-- git integration
	use("lewis6991/gitsigns.nvim") -- show line modifications on left hand side

	-- indent
	use("lukas-reineke/indent-blankline.nvim")

	-- diffview
	use({ "sindrets/diffview.nvim", requiers = "nvim-lua/plenary.nvim" })

	-- nvim-ts-context-commentstring for better commenting when on JSX files
	use("JoosepAlviste/nvim-ts-context-commentstring")

	-- lazygit plugin
	use("kdheepak/lazygit.nvim") -- open lazygit inside neovim

	if packer_bootstrap then
		require("packer").sync()
	end
end)
