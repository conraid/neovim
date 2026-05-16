-- Disabilita preventivamente il caricamento del parser Treesitter per Lua
-- In attesa che si risolvano i problemi con nvim-treesitter che ultimamente
-- mi han creato problemi e davano errore in avvio.
vim.treesitter.language.require_parser = function(lang)
  if lang == "lua" then
    error("Parser disabilitato intenzionalmente")
  end
end

-- Sovrascrive la funzione di start del modulo per bloccare il crash sul nascere
local ts = vim.treesitter
if ts then
  ts.start = function() return false end
end
