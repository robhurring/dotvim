local telescope_builtin = require('telescope.builtin')

-- note: diagnostics are not exclusive to lsp servers
-- so these can be global keybindings
vim.keymap.set('n', 'gl', '<cmd>lua vim.diagnostic.open_float()<cr>')
vim.keymap.set('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<cr>')
vim.keymap.set('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<cr>')

-- local function quickfix()
--   vim.lsp.buf.code_action({
--     filter = function(a) return a.isPreferred end,
--     apply = true
--   })
-- end

vim.api.nvim_create_autocmd('LspAttach', {
  desc = 'LSP actions',
  callback = function(event)
    local opts = { buffer = event.buf }

    -- these will be buffer-local keybindings
    -- because they only work if you have an active language server
    vim.keymap.set('n', 'gd', telescope_builtin.lsp_definitions, opts)
    vim.keymap.set('n', 'gD', telescope_builtin.lsp_definitions, opts)
    vim.keymap.set('n', '<c-]>', telescope_builtin.lsp_implementations, opts)
    vim.keymap.set('n', 'gi', function() vim.lsp.buf.implementation() end, opts)
    vim.keymap.set('n', 'go', function() vim.lsp.buf.type_definition() end, opts)

    vim.keymap.set('n', '<leader>vr', function() vim.lsp.buf.references() end, opts)
    vim.keymap.set('n', 'K', function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set('n', '<leader>vws', function() vim.lsp.buf.workspace_symbol() end, opts)
    vim.keymap.set('n', '<leader>vd', function() vim.diagnostic.open_float() end, opts)
    vim.keymap.set('n', '<tab>', function() vim.lsp.buf.code_action() end, opts)
    vim.keymap.set('n', '<F6>', function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set('i', '<C-h>', function() vim.lsp.buf.signature_help() end, opts)
    vim.keymap.set('n', '<leader>=', function() vim.lsp.buf.format({ async = true }) end, opts)
    -- vim.keymap.set('n', '<leader>qf', quickfix, opts)

    -- vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
    -- vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
  end
})

local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()

local default_setup = function(server)
  require('lspconfig')[server].setup({
    capabilities = lsp_capabilities,
  })
end

require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = { 'tsserver', 'lua_ls', 'gopls', 'jedi_language_server' },
  handlers = {
    default_setup,
  },
})

-- copilot setup
require("copilot").setup({
  suggestion = {
    auto_trigger = true
  },
})

local copilot = require('copilot.suggestion')
local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }

local function tab_copilot(fallback)
  local entry = cmp.get_selected_entry()

  if entry then
    cmp.confirm()
  else
    -- if copilot is visible and no entry is selected, accept the copilot suggestion
    if copilot.is_visible() then
      copilot.accept()
    else
      if cmp.visible() then
        -- auto-select first item
        cmp.select_next_item({ behavior = cmp_select })
        cmp.confirm()
      else
        -- default behavior
        fallback()
      end
    end
  end
end

cmp.setup({
  completion = {
    autocomplete = false,
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'path' },
    { name = 'nvim_lua' },
    { name = 'luasnip', keyword_length = 2 },
    { name = 'buffer',  keyword_length = 3 },
  },
  mapping = cmp.mapping.preset.insert({
    ['<c-k>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<c-j>'] = cmp.mapping.select_next_item(cmp_select),
    ['<c-e>'] = cmp.mapping.abort(),
    ['<cr>'] = cmp.mapping.confirm({ select = false }),
    ['<c-space>'] = cmp.mapping.complete(),
    ['<tab>'] = cmp.mapping(tab_copilot),
  }),
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  experimental = {
    ghost_text = true,
  }
})

require('lspconfig').lua_ls.setup({
  capabilities = lsp_capabilities,
  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT'
      },
      diagnostics = {
        globals = { 'vim' },
      },
      workspace = {
        library = {
          vim.env.VIMRUNTIME,
        }
      }
    }
  }
})

require("lsp-colors").setup({
  Error = "#db4b4b",
  Warning = "#e0af68",
  Information = "#0db9d7",
  Hint = "#10B981"
})
