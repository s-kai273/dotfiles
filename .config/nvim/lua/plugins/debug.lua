return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "williamboman/mason.nvim",
      {
        "jay-babu/mason-nvim-dap.nvim",
        opts = {
          ensure_installed = { "codelldb" },
          handlers = {},
        },
      },
    },
    config = function()
      local dap = require("dap")

      vim.fn.sign_define("DapBreakpoint", {
        text = "●",
        texthl = "DiagnosticError",
        linehl = "",
        numhl = "",
      })
      vim.fn.sign_define("DapBreakpointCondition", {
        text = "◆",
        texthl = "DiagnosticWarn",
        linehl = "",
        numhl = "",
      })
      vim.fn.sign_define("DapStopped", {
        text = "▶",
        texthl = "DiagnosticInfo",
        linehl = "Visual",
        numhl = "",
      })

      vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint, { desc = "Toggle breakpoint" })
      vim.keymap.set("n", "<leader>dB", function()
        dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
      end, { desc = "Set conditional breakpoint" })
      vim.keymap.set("n", "<leader>dc", dap.continue, { desc = "Debug continue" })
      vim.keymap.set("n", "<leader>di", dap.step_into, { desc = "Debug step into" })
      vim.keymap.set("n", "<leader>do", dap.step_over, { desc = "Debug step over" })
      vim.keymap.set("n", "<leader>dO", dap.step_out, { desc = "Debug step out" })
      vim.keymap.set("n", "<leader>dr", dap.repl.toggle, { desc = "Toggle debug REPL" })
      vim.keymap.set("n", "<leader>dx", dap.terminate, { desc = "Terminate debugger" })
    end,
  },
  {
    "rcarriga/nvim-dap-ui",
    dependencies = {
      "mfussenegger/nvim-dap",
      "nvim-neotest/nvim-nio",
    },
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")

      dapui.setup({
        wrap = true,
        mappings = {
          watch = "<leader>dw",
        },
        layouts = {
          {
            elements = {
              { id = "scopes", size = 0.25 },
              { id = "breakpoints", size = 0.25 },
              { id = "stacks", size = 0.25 },
              { id = "watches", size = 0.25 },
            },
            size = 80,
            position = "left",
          },
          {
            elements = {
              "repl",
              "console",
            },
            size = 10,
            position = "bottom",
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

      vim.keymap.set("n", "<leader>du", dapui.toggle, { desc = "Toggle debugger UI" })
    end,
  },
  {
    "mrcjkb/rustaceanvim",
    version = "^9",
    lazy = false,
    init = function()
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      local ok, cmp = pcall(require, "cmp_nvim_lsp")
      if ok then
        capabilities = cmp.default_capabilities(capabilities)
      end

      vim.g.rustaceanvim = {
        server = {
          capabilities = capabilities,
        },
      }
    end,
  },
}
