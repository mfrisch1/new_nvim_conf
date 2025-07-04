-- For `plugins/markview.lua` users.
return {
	"OXY2DEV/markview.nvim",
	lazy = false,
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		require("markview").setup({
			experimental = {
				check_rtp = true,
				check_rtp_message = false, -- hide working
			},
		})
	end,
}
