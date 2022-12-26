-- NVim-Tree
require('nvim-tree').setup({
  open_on_setup = true,
  hijack_cursor = false,
  on_attach = function(bufnr)
    local bufmap = function(lhs, rhs, desc)
      vim.keymap.set('n', lhs, rhs, {buffer = bufnr, desc = desc})
    end

    -- See :help nvim-tree.api
    local api = require('nvim-tree.api')
    bufmap('gh', api.tree.toggle_hidden_filter, 'Toggle hidden files')
  end
})

