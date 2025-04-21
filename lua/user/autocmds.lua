-- ~/.config/nvim/lua/user/autocmds.lua

vim.api.nvim_clear_autocmds({ event = "SwapExists" })

vim.api.nvim_create_autocmd("CmdlineEnter", {
  pattern = { "/", "?" },
  callback = function() vim.opt.hlsearch = true end,
})

vim.api.nvim_create_autocmd("CmdlineLeave", {
  pattern = { "/", "?" },
  callback = function() vim.opt.hlsearch = false end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "php",
  callback = function()
    vim.cmd [[
      hi! def link phpDocTags  phpDefine
      hi! def link phpDocParam phpType
    ]]
  end,
})

vim.api.nvim_create_autocmd("BufRead", {
  pattern = "/tmp/mutt-*",
  command = "set tw=72"
})

vim.api.nvim_create_autocmd("BufReadPost", {
  callback = function()
    if vim.fn.line("'\"") > 0 and vim.fn.line("'\"") <= vim.fn.line("$") then
      vim.cmd("normal! g`\"")
    end
  end,
})

vim.api.nvim_create_autocmd({ "BufEnter", "BufNew" }, {
  pattern = "*.info",
  callback = function()
    if vim.fn.filereadable(vim.fn.expand('%:p:r') .. '.SlackBuild') == 1 then
      vim.bo.filetype = 'sh'
    end
  end,
})

vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank {timeout = 550}
  end,
})

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = "ChangeLog.*",
  command = "setlocal expandtab shiftwidth=2 softtabstop=0"
})

-- Custom cursorline color on mode change
local colors = {
  default = '#111111',
  red = '#431f1f',
  green = '#284134',
}

local function set_status_color(mode)
  local color = mode == 'i' and colors.green or (mode == 'r' and colors.red or colors.default)
  vim.cmd('hi CursorLine guibg=' .. color)
end

vim.api.nvim_create_autocmd("InsertEnter", {
  callback = function() set_status_color(vim.fn.mode()) end
})
vim.api.nvim_create_autocmd("InsertChange", {
  callback = function() set_status_color(vim.fn.mode()) end
})
vim.api.nvim_create_autocmd("InsertLeave", {
  callback = function() set_status_color('n') end
})

