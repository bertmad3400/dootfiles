local M = {}

function M.init()
	for i, plugName in pairs({"bufferline", "lualine", "nvim-tree", "telescope", "treesitter"}) do
		require("plugins." .. plugName)
	end
end

M.install = require("plugins.install")

return M
