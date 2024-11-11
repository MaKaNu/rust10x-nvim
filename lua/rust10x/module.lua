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
      args = { "clone", "https://github.com/rust10x/rust10x-vscode", snippets_repo:absolute() },
    }):sync()
  end

  if not snippets_path:exists() then
    snippets_path.mkdir(snippets_path)
  end

  local snippets = Path:new(snippets_repo:absolute() .. "/snippets")
  snippets:copy({ destination = snippets_path:absolute(), recursive = true })

  return snippets_location
end

return M
