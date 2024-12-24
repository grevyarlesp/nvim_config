local M = {}

--- Bundle every configs|plugins we need for specific language
---@type table<string,boolean>
M.langs = {
    lua = true,
}

--- Root patterns for auto detect and change root
---@type string[]
M.root_patterns = { ".git" }

return M
