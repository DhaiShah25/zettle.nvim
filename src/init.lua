local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local conf = require("telescope.config").values

-- our picker function: colors
local names = function(opts)
	opts = opts or {}

	local obj = vim.system({ "zettle", "/Users/3011852/dev/vault" }, { text = true }):wait()
	local tbl_func = loadstring("return " .. obj.stdout)
	vim.print(f)
	local files = tbl_func and tbl_func() or {}

	pickers
		.new(opts, {
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
			sorter = conf.file_sorter(opts),
			previewer = conf.file_previewer(opts),
		})
		:find()
end

-- -- to execute the function
names()
