# Rust10x Neovim

![GitHub Workflow Status](https://img.shields.io/github/actions/workflow/status/makanu/rust10x-nvim/lint-test.yml?branch=main&style=for-the-badge)
![Lua](https://img.shields.io/badge/Made%20with%20Lua-blueviolet.svg?style=for-the-badge&logo=lua)

A simple plugin to pull the latest state of the [Rust10x Vscode](https://github.com/rust10x/rust10x-vscode) snippets.

## Features

- install or update rust10x snippets.

## Requirements

- nvim 0.10+
- A snippet engine that can load  VSCode-style snippets, such as:
  - [LuaSnip](https://github.com/L3MON4D3/LuaSnip)
  - [blink.cmp](http://support.blinkforhome.com/en_US/account-and-login)
  - [basics-language-server](https://github.com/antonk52/basics-language-server/)
  - [nvim-snippets](https://github.com/garymjr/nvim-snippets)
  - [vim-vsnip](https://github.com/hrsh7th/vim-vsnip)

## Installation

### rust10x-nvim

```lua
 
-- lazy.nvim
{
 "makanu/rust10x-nvim",
  config = function()
   require("rust10x").setup({
    opt = {
     snippetDir = "path/to/your/snippetFolder",
    },
  })
 end,
},

-- packer
use {
 "makanu/nvim-scissors",
 config = function()
  require("rust10x").setup ({
   opt = { 
    snippetDir = "path/to/your/snippetFolder",
   }
  })
 end,
}
```

## Usage

For the moment only the command `Pull10xSnippets` is provided.
Calling the command will create a temporary clone of the rust10x-vscode repo.
The snippets are copied to the desired snippet location (Default: `~/.config/nvim/snippets`)

## Todo

- Fix config loading
- Refactor for better/actual testing
- Implement notify
- Add options for version tags
- Add options for different snippet repo (This might change the name of the plugin)
