return {
  {
    "nvim-java/nvim-java",
    dependencies = {
      "nvim-java/lua-async-await",
      "nvim-java/nvim-java-core",
      "nvim-java/nvim-java-test",
      "nvim-java/nvim-java-dap",
      "nvim-java/nvim-java-refactor",
      "MunifTanjim/nui.nvim",
      "mfussenegger/nvim-jdtls",
      "neovim/nvim-lspconfig",
    },
    config = function()
      require("java").setup()
      require("lspconfig").jdtls.setup({})
    end,
  },
}
