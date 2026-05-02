return {
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/neotest-jest",
      "marilari88/neotest-vitest",
    },
    opts = function(_, opts)
      opts.adapters = opts.adapters or {}

      local jest_configs = { "jest.config.ts", "jest.config.js", "jest.config.mjs", "jest.config.cjs" }
      local vitest_configs = { "vitest.config.ts", "vitest.config.js", "vitest.config.mjs" }

      -- Walks up from file_path; returns ("jest"|"vitest", root_dir) for the nearest config, or nil.
      local function detect_runner(file_path)
        local current = vim.fn.fnamemodify(file_path, ":p:h")
        while current ~= "/" and current ~= "" do
          for _, name in ipairs(jest_configs) do
            if vim.fn.filereadable(current .. "/" .. name) == 1 then
              return "jest", current
            end
          end
          for _, name in ipairs(vitest_configs) do
            if vim.fn.filereadable(current .. "/" .. name) == 1 then
              return "vitest", current
            end
          end
          current = vim.fn.fnamemodify(current, ":h")
        end
        return nil, nil
      end

      local function is_spec_file(file_path)
        return file_path:match("%.spec%.[jt]sx?$") ~= nil or file_path:match("%.test%.[jt]sx?$") ~= nil
      end

      table.insert(
        opts.adapters,
        require("neotest-jest")({
          jestCommand = "pnpm exec jest",
          cwd = function(file_path)
            local runner, root = detect_runner(file_path)
            return (runner == "jest" and root) or vim.fn.getcwd()
          end,
          isTestFile = function(file_path)
            if not is_spec_file(file_path) then
              return false
            end
            local runner = detect_runner(file_path)
            return runner == "jest"
          end,
        })
      )

      table.insert(
        opts.adapters,
        require("neotest-vitest")({
          vitestCommand = "pnpm exec vitest",
          cwd = function(file_path)
            local runner, root = detect_runner(file_path)
            return (runner == "vitest" and root) or vim.fn.getcwd()
          end,
          is_test_file = function(file_path)
            if not is_spec_file(file_path) then
              return false
            end
            local runner = detect_runner(file_path)
            return runner == "vitest"
          end,
        })
      )
    end,
  },
}
