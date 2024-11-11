local plugin = require("rust10x")

describe("setup", function()
  it("works with default", function()
    assert(
      plugin.pull() == vim.fn.stdpath("config") .. "/snippets",
      "pull function with param = ~/.config/nvim/snippets/"
    )
  end)

  it("works with custom var", function()
    plugin.setup({ opt = { snippetDir = "custom" } })
    assert(plugin.pull() == "custom", "pull function with param = custom")
  end)
end)
