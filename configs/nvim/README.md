# Nvim Plugins

- olimorris/onedarkpro.nvim - Color scheme for nvim
- tpope/vim-fugitive - Git wrapper
- VonHeikemen/lsp-zero.nvim - Manager for LSP services
  - williamboman/mason.nvim - Manager for LSP servers, DAP serviers, linters and formatters
  - hrsh7th/nvim-cmp - Autocompletion
- ojroques/nvim-osc52 - Clipboard manager
- nvim-telescope/telescope.nvim - File fuzzy finder
- nvim-treesitter/nvim-treesitter - An interface to tree-sitter, a concrete syntax tree builder

# Nvim shortcuts

## Normal mode

<leader>pv - [p]roject [v]iew
<leader>gs, vim.cmd.Git --[g]it [s]tatus
<leader>u - [u]ndo tree

vim.keymap.set("i", "<C-s>", vim.lsp.buf.signature_help) --[s]ignature
vim.keymap.set("n", "<C-s>", vim.lsp.buf.signature_help) --[s]ignature
