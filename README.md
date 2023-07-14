# indexcard.nvim

Display an indexcard to help remember stuff you want to learn.

## Rationale

I frequently find out something new about vim or Neovim, that I want to integrate into
my workflow. However, when I find myself back in Neovim, I'm back in my usual workflow
and completely forget about what I wanted to integrate.

This plugin allows you to define an index card and display it whenever you want to
remember what you wanted to learn.

## Setup

```lua
require("indexcard").setup({
    cards = {
        { "This is a card." },
        { "dd - delete line under cursor" },
    },
})
```

| Property | Type         | Description                                                    |
| -------- | ------------ | -------------------------------------------------------------- |
| `cards`  | `string[][]` | Cards to configure. Every card is a table of individual lines. |

## Usage

```vim
:lua require("indexcard").show()
:lua require("indexcard").hide()
:lua require("indexcard").toggle()
:lua require("indexcard").next()
:lua require("indexcard").prev()
```
