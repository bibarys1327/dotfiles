return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "nvim-neotest/nvim-nio",
      "mxsdev/nvim-dap-vscode-js",
    },
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")

      dapui.setup()

      -- Проверяем, существует ли модуль перед настройкой
      local ok, dap_vscode_js = pcall(require, "dap-vscode-js")
      if ok then
        dap_vscode_js.setup({
          debugger_path = vim.fn.stdpath("data") .. "/mason/packages/js-debug-adapter",
          adapters = { "pwa-node" },
        })
      end

      dap.listeners.after.event_initialized["dapui_config"] = function() dapui.open() end
      dap.listeners.before.event_terminated["dapui_config"] = function() dapui.close() end
      dap.listeners.after.event_exited["dapui_config"] = function() dapui.close() end
    end,
  }
}
