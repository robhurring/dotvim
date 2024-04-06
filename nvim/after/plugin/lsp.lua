local lsp_zero = require('lsp-zero')
local telescope_builtin = require('telescope.builtin')

-- local function quickfix()
--   vim.lsp.buf.code_action({
--     filter = function(a) return a.isPreferred end,
--     apply = true
--   })
-- end

lsp_zero.on_attach(function(_, bufnr)
  local opts = { buffer = bufnr, remap = false }

  vim.keymap.set("n", "gd", telescope_builtin.lsp_definitions, opts)
  vim.keymap.set("n", "<c-]>", telescope_builtin.lsp_implementations, opts)

  vim.keymap.set("n", "<leader>vr", function() vim.lsp.buf.references() end, opts)
  vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
  vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
  vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
  vim.keymap.set("n", "]d", function() vim.diagnostic.goto_next() end, opts)
  vim.keymap.set("n", "[d", function() vim.diagnostic.goto_prev() end, opts)
  vim.keymap.set("n", "<tab>", function() vim.lsp.buf.code_action() end, opts)
  vim.keymap.set("n", "<F6>", function() vim.lsp.buf.rename() end, opts)
  vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
  vim.keymap.set('n', '<leader>=', function() vim.lsp.buf.format() end, opts)

  -- debugger
  -- vim.keymap.set('n', '<leader>qf', quickfix, opts)
end)

-- to learn how to use mason.nvim with lsp-zero
-- read this: https://github.com/VonHeikemen/lsp-zero.nvim/blob/v3.x/doc/md/guides/integrate-with-mason-nvim.md
require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = { 'tsserver', 'lua_ls', 'gopls', 'jedi_language_server' },
  handlers = {
    lsp_zero.default_setup,
    lua_ls = function()
      local lua_opts = lsp_zero.nvim_lua_ls()
      require('lspconfig').lua_ls.setup(lua_opts)
    end,
  }
})

local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }

-- this is the function that loads the extra snippets to luasnip
-- from rafamadriz/friendly-snippets
require('luasnip.loaders.from_vscode').lazy_load()

-- https://github.com/hrsh7th/nvim-cmp/wiki/Example-mappings#luasnip
cmp.setup({
  sources = {
    { name = 'path' },
    { name = 'nvim_lsp' },
    { name = 'nvim_lua' },
    { name = 'luasnip', keyword_length = 2 },
    { name = 'buffer',  keyword_length = 3 },
  },
  formatting = lsp_zero.cmp_format(),
  mapping = cmp.mapping.preset.insert({
    ['<c-k>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<c-j>'] = cmp.mapping.select_next_item(cmp_select),
    ['<c-e>'] = cmp.mapping.abort(),
    ['<cr>'] = cmp.mapping.confirm({ select = false }),
    ['<c-space>'] = cmp.mapping.complete(),
    ['<tab>'] = cmp.mapping(function(fallback)
      -- This little snippet will confirm with tab, and if no entry is selected, will confirm the first item
      if cmp.visible() then
        local entry = cmp.get_selected_entry()
        if not entry then
          cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
        end
        cmp.confirm()
      else
        fallback()
      end
    end, { "i", "s", }),
  }),
})

require("lsp-colors").setup({
  Error = "#db4b4b",
  Warning = "#e0af68",
  Information = "#0db9d7",
  Hint = "#10B981"
})
