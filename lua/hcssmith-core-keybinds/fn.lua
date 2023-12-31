local fn = {}


---@param keymap_tbl KeyBindList
---@param bufnr number?
function fn.SetKeymaps(keymap_tbl, bufnr)
  local modes = {
    { "insert",   "i" },
    { "normal",   "n" },
    { "visual",   "v" },
    { "terminal", "t" }
  }
  for _, v in ipairs(modes) do
    if keymap_tbl[v[1]] ~= nil then
      for _, km in ipairs(keymap_tbl[v[1]]) do
        ---@type KeyBind
        km = km
        local opts = km[3]
        if opts == nil and bufnr ~= nil then
          opts = {
            buffer = bufnr
          }
        end
        vim.keymap.set(v[2], km[1], km[2], opts)
      end
    end
  end
end

return fn
