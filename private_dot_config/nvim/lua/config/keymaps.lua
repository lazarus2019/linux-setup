-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = vim.keymap.set
-- local nomap = vim.keymap.del
local opts = { noremap = true, silent = true }

map("n", ";", ":", { desc = "CMD" })

map("n", "<leader>th", "<cmd>ToggleTerm direction=horizontal<CR>", { desc = "Toggle terminal horizontal" })
map("n", "<leader>tv", "<cmd>ToggleTerm direction=vertical<CR>", { desc = "Toggle terminal vertical" })
map("n", "<leader>tf", "<cmd>ToggleTerm direction=float<CR>", { desc = "Toggle terminal float" })

vim.api.nvim_create_autocmd("TermOpen", {
  callback = function()
    -- local opts = { noremap = true, silent = true, buffer = true }
    -- Map <C-k> to move to the above buffer
    map("t", "<C-k>", [[<C-\><C-n><C-w>k]], opts)
    -- Map <C-j> to move to the below buffer
    map("t", "<C-j>", [[<C-\><C-n><C-w>j]], opts)
    -- Additional terminal navigation mappings (optional)
    map("t", "<C-h>", [[<C-\><C-n><C-w>h]], opts)
    map("t", "<C-l>", [[<C-\><C-n><C-w>l]], opts)
  end,
})
