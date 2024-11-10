local plugin = require("rust10x")

describe("setup", function()
  it("works with default", function()
    assert(plugin.pull() == "Hello!", "my first function with param = Hello!")
  end)

  it("works with custom var", function()
    plugin.setup({ opt = "custom" })
    assert(plugin.pull() == "custom", "my first function with param = custom")
  end)
end)
