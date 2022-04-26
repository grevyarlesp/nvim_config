
local ok, nvim_tree = pcall(require, 'nvim-tree')

if (not ok) then
    return
end

local ok, view = pcall(require, "nvim-tree.view")

if (not ok) then
    return
end

local tree ={}
tree.open = function ()
   require'bufferline.state'.set_offset(31, 'FileTree')
   require'nvim-tree'.find_file(true)

   nvim_tree.open()
end

tree.close = function ()
   require'bufferline.state'.set_offset(0)
   view.close()
end

tree.toggle = function()
    if view.is_visible() then
        tree.close()
    else
        tree.open()
    end
end

return tree 
