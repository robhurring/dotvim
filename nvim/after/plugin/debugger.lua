local dap = require('dap')

require('dap-go').setup {
  dap_configurations = {
    {
      type = "go",
      name = "Go: Remote Attach",
      mode = "remote",
      request = "attach",
      connect = function()
        local host = vim.fn.input('Host [127.0.0.1]: ')
        host = host ~= '' and host or '127.0.0.1'
        local port = tonumber(vim.fn.input('Port [2345]: ')) or 2345

        return {
          host = host,
          port = port
        }
      end,
    },
  },
}

local dapui = require('dapui')
dapui.setup({
  icons = {
    expanded = "↓",
    collapsed = "→",
    current_frame = "🔥"
  },
  controls = {
    icons = {
      pause = "Pause",
      play = "Play",
      step_into = "Into",
      step_over = "Over",
      step_out = "Out",
      step_back = "Back",
      run_last = "RL",
      terminate = "Term",
      disconnect = "Disc",
    },
  },

})

dap.listeners.before.attach.dapui_config = function()
  dapui.open()
end
dap.listeners.before.launch.dapui_config = function()
  dapui.open()
end
dap.listeners.before.event_terminated.dapui_config = function()
  dapui.close()
end
dap.listeners.before.event_exited.dapui_config = function()
  dapui.close()
end

-- Adding symbols for breakpoints and such
vim.fn.sign_define('DapBreakpoint', { text = '⬤ ', texthl = 'Error', linehl = '', numhl = '' })
vim.fn.sign_define('DapStopped', { text = '→', texthl = '', linehl = '', numhl = '' })

-- Keymaps for debugging
vim.keymap.set('n', 'cod', dap.toggle_breakpoint)
vim.keymap.set('n', '<f7>', dap.step_into)
vim.keymap.set('n', '<f8>', dap.continue)
vim.keymap.set('n', '<f9>', dap.step_over)
vim.keymap.set('n', '<f6>', dap.step_out)
vim.keymap.set('n', '<leader>dr', dap.repl.open)
vim.keymap.set('n', '<leader>du', dapui.toggle)
