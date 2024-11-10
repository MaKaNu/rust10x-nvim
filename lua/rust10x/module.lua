---@class CustomModule
local M = {}

---@return string
M.pull_snippets = function(snippets_location)
  local Path = require("plenary.path")
  local Job = require("plenary.job")

  local snippets_repo_path = "/tmp/rust10x.temp"
  local snippets_path = Path:new(snippets_location)

  local snippets_repo = Path:new(snippets_repo_path)

  if snippets_repo:exists() then
    Job:new({
      command = "git",
      args = { "pull" },
      cwd = snippets_repo:absolute(),
    }):sync()
  else
    Job:new({
      command = "git",
      args = { "clone", "https://github.com/your-forked-snippets-repo", snippets_repo:absolute() },
    }):sync()
  end

  if not snippets_path:exists() then
    snippets_path.mkdir()
  end

  Job:new({
    command = "cp",
    args = { snippets_repo:absolute() .. "snippets", snippets_path.absolute() },
  }):sync()

  return snippets_location
end

return M
