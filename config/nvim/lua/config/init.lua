-- Define a global table to hold local system overrides
_G.LocalConfig = {
  copilot = {
    enabled = true,
  },
  codecompanion = {
    adapter = 'copilot',
    model = 'gemini-3.7-flash',
  }
}

-- Safely try to load a local-settings file
local has_local, local_settings = pcall(require, "config.local-settings")
if has_local and type(local_settings) == "table" then
  _G.LocalConfig = vim.tbl_deep_extend("force", _G.LocalConfig, local_settings)
end
