
local map = vim.keymap.set

-- For managing buffers
map('n', 'zq', '<cmd>Bwipeout<cr>')
map('n', 'ZQ', '<cmd>bufdo :Bwipeout<cr>')
map('n', 'ZE', '<cmd>qa<cr>')

-- For managing splits
map('n', '<C-J>', '<C-W><C-J>')
map('n', '<C-K>', '<C-W><C-K>')
map('n', '<C-L>', '<C-W><C-L>')
map('n', '<C-H>', '<C-W><C-H>')

-- For telescope
map('n', '<leader>fo', '<cmd>Telescope buffers<cr>')
map('n', '<leader><space>', '<cmd>Telescope oldfiles<cr>')
map('n', '<leader>fc', '<cmd>Telescope current_buffer_fuzzy_find<cr>')
map('n', '<leader>ff', '<cmd>Telescope find_files<cr>')
map('n', '<leader>fg', '<cmd>Telescope live_grep<cr>')
map('n', '<leader>fd', '<cmd>Telescope diagnostics<cr>')

-- For the bufferline
for i = 1, 9 do
  map('n', '<leader>' .. i, function()
    require("bufferline").go_to_buffer(i, true)
  end)
end

map('n', '<leader>l', '<cmd>bnext<cr>')
map('n', '<leader>h', '<cmd>bprev<cr>')
