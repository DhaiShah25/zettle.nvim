local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local conf = require("telescope.config").values

local M = {}

local opts = {}

M.setup = function(u_opts)
	opts = u_opts or {
		dir = "~/vault",
	}
end

M.names = function()
	local obj = vim.system({ "zettle", vim.fn.expand(opts.dir) }, { text = true }):wait()
	local tbl_func = loadstring("return " .. obj.stdout)
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
