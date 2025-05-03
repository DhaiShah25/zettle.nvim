# Zettle.nvim

This is a simple program that parses a specific directory for markdown files.
It uses the first heading in the file as the title which is then fuzzy searched
over.

## Install

To use this you need an acconompanying rust binary which is in this repository.

### Rust Binary

```sh
cargo install --git https://github.com/DhaiShah25/zettle.nvim
```

### Lazy.nvim

- using plugin dir

```lua
return {
    "DhaiShah25/zettle.nvim",
    opts = {
        -- The directory containing the markdown notes
        "~/vault",
    },
    dependencies = {
		"nvim-telescope/telescope.nvim",
	},

}

```

**To Fuzzy Find over the Notes just Use the names function**

`lua 	require("zettle").names()`
