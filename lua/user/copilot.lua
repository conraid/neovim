-- ~/.config/nvim/lua/user/copilot.lua

-- Abilita Copilot solo in modalità insert
vim.g.copilot_no_tab_map = true

vim.api.nvim_set_keymap("i", "<C-J>", 'copilot#Accept("<CR>")', {
  expr = true,
  silent = true,
  noremap = true,
})

-- Disattiva Copilot per certi filetype (es: commit, help)
vim.g.copilot_filetypes = {
  ["TelescopePrompt"] = false,
  ["neo-tree"] = false,
  ["help"] = false,
  ["gitcommit"] = false,
}

