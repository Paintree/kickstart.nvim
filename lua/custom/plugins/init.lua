-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  'mbbill/undotree',
  keys = {
    { '<leader>u', ':UndotreeToggle<CR>', desc = 'Toggle Undo Tree' },
  },
  {
    'sainnhe/everforest',
    lazy = false, -- load on startup
    priority = 1000, -- make sure it's loaded before other plugins
    config = function()
      vim.g.everforest_background = 'hard' -- soft, medium, hard
      vim.g.everforest_enable_italic = 1
      vim.g.everforest_diagnostic_text_highlight = 1
      vim.g.everforest_better_performance = 1
      vim.cmd.colorscheme 'everforest'

      -- Apply colorscheme immediately
      vim.cmd [[colorscheme everforest]]

      -- Ensure it's reapplied after other plugins set highlights
      vim.api.nvim_create_autocmd('ColorScheme', {
        pattern = '*',
        callback = function()
          vim.cmd [[colorscheme everforest]]
        end,
      })
    end,
  },
}
