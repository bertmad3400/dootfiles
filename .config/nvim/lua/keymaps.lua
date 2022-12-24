local defaults = { noremap=true, silent=true }

local map = vim.api.nvim_set_keymap

-- For managin splits
map('n', '<C-J>', '<C-W><C-J>', defaults)
map('n', '<C-K>', '<C-W><C-K>', defaults)
map('n', '<C-L>', '<C-W><C-L>', defaults)
map('n', '<C-H>', '<C-W><C-H>', defaults)

-- For telescope
vim.keymap.set('n', '<leader>fo', '<cmd>Telescope buffers<cr>')
vim.keymap.set('n', '<leader><space>', '<cmd>Telescope oldfiles<cr>')
vim.keymap.set('n', '<leader>fc', '<cmd>Telescope current_buffer_fuzzy_find<cr>')
vim.keymap.set('n', '<leader>ff', '<cmd>Telescope find_files<cr>')
vim.keymap.set('n', '<leader>fg', '<cmd>Telescope live_grep<cr>')
vim.keymap.set('n', '<leader>fd', '<cmd>Telescope diagnostics<cr>')

-- For the bufferline
for i = 1, 9 do
  vim.keymap.set('n', '<leader>' .. i, function()
    require("bufferline").go_to_buffer(i, true)
  end)
end

vim.keymap.set('n', '<leader>l', '<cmd>bnext<cr>')
vim.keymap.set('n', '<leader>h', '<cmd>bprev<cr>')
