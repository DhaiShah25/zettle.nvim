local files = {
	{ "English", "/Users/3011852/dev/vault/fleeting/1740408495.md" },
	{ "US 1 Review Project: Road to The Civil War", "/Users/3011852/dev/vault/fleeting/1739849926.md" },
	{ "Chemistry Reaction Rules", "/Users/3011852/dev/vault/fleeting/1739379732.md" },
	{ "Get Game Ideas", "/Users/3011852/dev/vault/fleeting/1742256580.md" },
	{ "How to Create Good Notes (for School)", "/Users/3011852/dev/vault/fleeting/1738535830.md" },
	{ "e-matrix.md", "/Users/3011852/dev/vault/fleeting/e-matrix.md" },
	{ "Math", "/Users/3011852/dev/vault/fleeting/1740416192.md" },
	{ "Shadow and Bone Trilogy", "/Users/3011852/dev/vault/fleeting/1736988116.md" },
	{ "AP Prep", "/Users/3011852/dev/vault/fleeting/1740746845.md" },
	{ "Keystone Habits", "/Users/3011852/dev/vault/fleeting/1743744329.md" },
	{ "Hi", "/Users/3011852/dev/vault/fleeting/Untitled.dj" },
	{ "French", "/Users/3011852/dev/vault/fleeting/1741185014.md" },
	{ "How to LEQ", "/Users/3011852/dev/vault/fleeting/1737434933.md" },
	{ "History", "/Users/3011852/dev/vault/fleeting/1740431035.md" },
	{ "Frost Byte - Game Engine", "/Users/3011852/dev/vault/fleeting/1742611127.md" },
	{ "Blender Tips", "/Users/3011852/dev/vault/fleeting/1738796974.md" },
	{ "Summer Courses", "/Users/3011852/dev/vault/fleeting/1740414673.md" },
	{ "TASKS.md", "/Users/3011852/dev/vault/fleeting/TASKS.md" },
	{ "Todos.md", "/Users/3011852/dev/vault/fleeting/Todos.md" },
	{ "Chemistry", "/Users/3011852/dev/vault/fleeting/1740415999.md" },
	{ "Productivity Tips", "/Users/3011852/dev/vault/fleeting/1739651352.md" },
	{ "Tempest - Chromium fork", "/Users/3011852/dev/vault/fleeting/1740406979.md" },
	{ "Placement", "/Users/3011852/dev/vault/fleeting/1740416166.md" },
	{ "Heir Of Ra", "/Users/3011852/dev/vault/fleeting/1736988131.md" },
	{ "Aristotle and Dante Discover the Secrets of the Universe", "/Users/3011852/dev/vault/fleeting/1736988203.md" },
	{ "The Book Thief", "/Users/3011852/dev/vault/fleeting/1736988192.md" },
	{ "Wish Upon a Lantern", "/Users/3011852/dev/vault/fleeting/1736988074.md" },
	{ "Varunika Shree Prabhuram", "/Users/3011852/dev/vault/permanent/1734405198.md" },
	{ "Camila", "/Users/3011852/dev/vault/permanent/1733802892.md" },
	{ "Lucy Pyre", "/Users/3011852/dev/vault/permanent/1734577707.md" },
	{ "Toma", "/Users/3011852/dev/vault/permanent/1733802844.md" },
	{ "How To Learn To Code", "/Users/3011852/dev/vault/permanent/1734729117.md" },
	{ "Evil Neuro", "/Users/3011852/dev/vault/permanent/1733803389.md" },
	{ "Ellie_Minibot", "/Users/3011852/dev/vault/permanent/1734047544.md" },
	{ "VedalVerse", "/Users/3011852/dev/vault/permanent/1734627398.md" },
	{ "Layna", "/Users/3011852/dev/vault/permanent/1733803490.md" },
	{ "Akuma Nihmune", "/Users/3011852/dev/vault/permanent/1734576660.md" },
	{ "VedalAI", "/Users/3011852/dev/vault/permanent/1735950766.md" },
	{ "vTuber", "/Users/3011852/dev/vault/permanent/1734626146.md" },
	{ "Neuro-sama", "/Users/3011852/dev/vault/permanent/1733803379.md" },
	{ "Vedal", "/Users/3011852/dev/vault/permanent/1733803041.md" },
	{ "SquChan", "/Users/3011852/dev/vault/permanent/1734130560.md" },
	{ "How To DBQ", "/Users/3011852/dev/vault/permanent/1734588542.md" },
	{ "Bao", "/Users/3011852/dev/vault/permanent/1734560138.md" },
	{ "Containers", "/Users/3011852/dev/vault/permanent/1734926858.md" },
	{ "Annie", "/Users/3011852/dev/vault/permanent/1733803093.md" },
	{ "Game Engine Design", "/Users/3011852/dev/vault/permanent/1735948535.md" },
	{ "Churchie", "/Users/3011852/dev/vault/permanent/1735950709.md" },
	{ "Linux (OS)", "/Users/3011852/dev/vault/permanent/1735765824.md" },
	{ "Study Efficiently", "/Users/3011852/dev/vault/permanent/1734057982.md" },
	{ "Filian", "/Users/3011852/dev/vault/permanent/1733803175.md" },
	{ "Get Good At Art", "/Users/3011852/dev/vault/permanent/1736289428.md" },
	{ "History Thesis", "/Users/3011852/dev/vault/permanent/1734588248.md" },
	{
		"2025-04-22 Sign up for financial literacy.md",
		"/Users/3011852/dev/vault/events/2025-04-22 Sign up for financial literacy.md",
	},
	{ "2025-04-09 Chemistry Quiz.md", "/Users/3011852/dev/vault/events/2025-04-09 Chemistry Quiz.md" },
	{ "Ideas", "/Users/3011852/dev/vault/events/2025-04-22 Conics Project.md" },
}

local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local conf = require("telescope.config").values

-- our picker function: colors
local colors = function(opts)
	opts = opts or {}
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

-- to execute the function
colors()
