local M = {
}

local chadtree_settings = {
    view = {
        width = 30
    },
}

function M.open()
  if package.loaded["bufferline.api"] then
    require("bufferline.state").set_offset(chadtree_settings.view.width + 1)
  end
end

function M.close()
  local buf = tonumber(vim.fn.expand "<abuf>")
  local ft = vim.api.nvim_buf_get_option(buf, "filetype")
  if ft == "CHADTree" and package.loaded["bufferline.state"] then
    require("bufferline.api").set_offset(0)
  end
end

function M.toggle()
    local opened = vim.api.nvim_get_var("chadtree_opened")
    if (opened) then
        M.close()
        vim.api.nvim_set_var("chadtree_opened", false)
    else
        M.open()
        vim.api.nvim_set_var("chadtree_opened", true)
    end
    vim.cmd([[:CHADopen]])
end

function M.setup()
    vim.api.nvim_set_var("chadtree_settings", chadtree_settings)
    vim.api.nvim_set_var("chadtree_opened", false)
end

return M
