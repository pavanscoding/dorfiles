local fzf = require('fzf_lib')

local slab = fzf.allocate_slab()
-- pattern: string
-- case_mode: number with 0 = smart_case, 1 = ignore_case, 2 = respect_case
-- fuzzy: enable or disable fuzzy matching. default true
local pattern_obj = fzf.parse_pattern(pattern, case_mode, fuzzy)

-- you can get the score/position for as many items as you want
-- line: string
-- score: number
local score = fzf.get_score(line, pattern_obj, slab)

-- table (does not have to be freed)
local pos = fzf.get_pos(line, pattern_obj, slab)

fzf.free_pattern(pattern_obj)
fzf.free_slab(slab)

require('telescope').load_extension('fzf')
