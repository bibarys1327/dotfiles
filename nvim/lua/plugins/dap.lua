return {
  'mfussenegger/nvim-dap',
  dependencies = {
    'rcarriga/nvim-dap-ui',
    'theHamsta/nvim-dap-virtual-text',
  },
  config = function()
    local dap = require('dap')
    local dapui = require('dapui')
    dapui.setup()

    -- Автооткрытие UI при старте отладки
    dap.listeners.after.event_initialized['dapui_config'] = function() dapui.open() end
    dap.listeners.before.event_terminated['dapui_config'] = function() dapui.close() end
    dap.listeners.before.event_exited['dapui_config'] = function() dapui.close() end

    -- Настройка адаптера для Node.js
    local js_debug_path = vim.fn.expand('$HOME/vscode-js-debug/dist/src/dapDebugServer.js')
    dap.adapters['pwa-node'] = {
      type = 'server',
      host = 'localhost',
      port = '${port}',
      executable = { command = 'node', args = { js_debug_path, '${port}' } },
    }

    -- Конфигурация для запуска
    dap.configurations.typescript = {
      {
        type = 'pwa-node',
        request = 'launch',
        name = 'Launch TypeScript File',
        program = '${file}',
        cwd = '${workspaceFolder}',
        runtimeExecutable = 'node',
        runtimeArgs = { '--loader', 'ts-node/esm' },
      },
      {
        type = 'pwa-node',
        request = 'attach',
        name = 'Attach to Process',
        processId = require('dap.utils').pick_process,
        cwd = '${workspaceFolder}',
      },
    }
    dap.configurations.javascript = dap.configurations.typescript
  end,
}