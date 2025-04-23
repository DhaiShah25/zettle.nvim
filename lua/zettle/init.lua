local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local conf = require("telescope.config").values

local M = {}

M.names = function(opts)
	opts = opts or {}

	local obj = vim.system({ "zettle", "/home/dhai/vault" }, { text = true }):wait()
	local tbl_func = loadstring("return " .. obj.stdout)
	vim.print(f)
	local files = tbl_func and tbl_func() or {}

	pickers
		.new({}, {
			prompt_title = "Notes",
			finder = finders.new_table({
				results = files,
				entry_maker = function(entry)
					print(entry)
					return {
						value = entry,
						display = entry[1],
						ordinal = entry[1],
						path = entry[2],
					}
				end,
			}),
			sorter = conf.file_sorter({}),
			previewer = conf.file_previewer(opts),
		})
		:find()
end

return M
