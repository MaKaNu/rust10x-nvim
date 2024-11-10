-- main module file
local module = require("rust10x.module")

---@class Config
---@field opt table Your config option
local config = {
  opt = {
    snippetDir = vim.fn.stdpath("config") .. "/snippets",
  },
}

---@class MyModule
local M = {}

---@type Config
M.config = config

---@param args Config?
-- you can define your setup function here. Usually configurations can be merged, accepting outside params and
-- you can also put some validation here for those.
M.setup = function(args)
  M.config = vim.tbl_deep_extend("force", M.config, args or {})

  -- normalizing e.g. expands `~` in provided snippetDir
  M.config.opt.snippetDir = vim.fs.normalize(M.config.opt.snippetDir)
end

M.pull = function()
  return module.pull_snippets(M.config.opt.snippetDir)
end

return M
