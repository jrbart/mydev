-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Example configs: https://github.com/LunarVim/starter.lvim
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny




lvim.plugins = {
  {
    'chipsenkbeil/distant.nvim',
    branch = 'v0.3',
    config = function()
      require('distant'):setup {
        -- Applies Chip's personal settings to every machine you connect to
        --
        -- 1. Ensures that distant servers terminate with no connections
        -- 2. Provides navigation bindings for remote directories
        -- 3. Provides keybinding to jump into a remote file's parent directory
        -- ['*'] = require('distant.settings').chip_default()
          ['*'] = {
            -- distant = {
            --   bin = '/path/to/distant',
            -- },
            lsp = {
              ['My Project'] = {
                -- cmd = { '/app/ex/elixir-ls/release/launch.sh' },
                cmd = { '/app/ex/elixir-ls/release/language_server.sh' },
                filetypes = { 'elixir' },
                root_dir = '/app/ex/le2/giphy_scraper/',
                on_attach = function()
                  vim.nnoremap('gD', '<CMD>lua vim.lsp.buf.declaration()<CR>')
                  vim.nnoremap('gd', '<CMD>lua vim.lsp.buf.definition()<CR>')
                  vim.nnoremap('gh', '<CMD>lua vim.lsp.buf.hover()<CR>')
                  vim.nnoremap('gi', '<CMD>lua vim.lsp.buf.implementation()<CR>')
                  vim.nnoremap('gr', '<CMD>lua vim.lsp.buf.references()<CR>')
                end,
              },
            },
          },
        }
    end
  },
  {
    'fenetikm/falcon'
  }
}
