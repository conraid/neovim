local status, neogit = pcall(require, "neogit")
if not status then
  return
end

neogit.setup({
  -- Utilizza la finestra corrente per Neogit invece di aprire split verticali o orizzontali
  kind = "replace",

  -- Disabilita i popup di notifica invasivi quando completi un'azione git
  notification_icon = "✔",

  -- Impostazioni grafiche base per i rami di Git
  graph_style = "unicode",
})
