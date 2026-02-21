return {
  {
    "mfussenegger/nvim-jdtls",
    ft = "java",
    config = function()
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "java",
        callback = function()
          local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
          local workspace_dir = vim.fn.stdpath("data") .. "/jdtls-workspace/" .. project_name

          require("jdtls").start_or_attach({
            cmd = { vim.fn.stdpath("data") .. "/mason/bin/jdtls", "-data", workspace_dir },
            root_dir = vim.fs.root(0, { "gradlew", "pom.xml", ".git" }),
            settings = {
              java = {
                import = { gradle = { enabled = true } },
                configuration = {
                  updateBuildConfiguration = "automatic",
                },
              },
            },
          })
        end,
      })
    end,
  },
}
