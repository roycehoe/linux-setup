# Nvim shortcuts

## Normal mode

<leader>pv - [p]roject [v]iew
<leader>gs, vim.cmd.Git --[g]it [s]tatus
<leader>u - [u]ndo tree

vim.keymap.set("i", "<C-s>", vim.lsp.buf.signature_help) --[s]ignature
vim.keymap.set("n", "<C-s>", vim.lsp.buf.signature_help) --[s]ignature
