local M = {}


---@type KeyBindList
local keymap = {
  insert = {
    { "jk", "<Esc>" }
  },
  terminal = {
    { "jk", "<C-\\><C-N>" },
  },
  normal = {
    { "<C-h>",     "<C-W><C-h>" },
    { "<C-j>",     "<C-W><C-j>" },
    { "<C-k>",     "<C-W><C-k>" },
    { "<C-l>",     "<C-W><C-l>" },
    { "<C-Left>",  "<C-W><C-h>" },
    { "<C-Down>",  "<C-W><C-j>" },
    { "<C-Up>",    "<C-W><C-k>" },
    { "<C-Right>", "<C-W><C-l>" },
    { ']q',        ':cn<CR>',     { silent = true } },
    { '[q',        ':cp<CR>',     { silent = true } },
    { ']Q',        ':clast<CR>',  { silent = true } },
    { '[Q',        ':cfirst<CR>', { silent = true } }
  },
  visual = {
    { 'J', ":m '>+1<CR>gv=gv", { silent = true } },
    { 'K', ":m '<-2<CR>gv=gv", { silent = true } }
  }
}

---@class KeyBind
---@field [1] string keybind trigger
---@field [2] string | function() keybind actions
---@field [3] table? opts

---@class KeyBindList
---@field insert KeyBind[] | nil
---@field terminal KeyBind[] | nil
---@field normal KeyBind[] | nil
---@field visual KeyBind[] | nil

---@class Opts
---@field keybinds KeyBindList?

---@param opts Opts
function M.setup(opts)
  opts = opts or {}

  local fn = require('hcssmith-core-keybinds.fn')

  fn.SetKeymaps(keymap)
  if opts.keybinds ~= nil then
    fn.SetKeymaps(opts.keybinds)
  end
end

return M
