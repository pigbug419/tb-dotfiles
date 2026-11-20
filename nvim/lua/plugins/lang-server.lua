return {
  {
    "williamboman/mason.nvim",
    lazy = false,
    config = function()
      require("mason").setup({})
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      vim.lsp.enable("lua_ls", {})
      vim.lsp.enable("rust_analyzer", {})
      vim.lsp.enable("clangd", {})
      vim.lsp.enable("pyright", {})
      vim.lsp.enable("cmake", {})
      vim.lsp.enable("docker_compose_language_service", {})
      vim.lsp.enable("dockerls", {})
      vim.lsp.enable("markdown_oxide", {})
    end,
  },
  {
    "mason-org/mason-lspconfig.nvim",
    opts = function()
      local ensure_installed = { "lua_ls", "rust_analyzer", "pyright" }
      if vim.fn.executable("clangd") == 0 then
        table.insert(ensure_installed, "clangd")
      end
      return { ensure_installed = ensure_installed }
    end,
    dependencies = {
      { "mason-org/mason.nvim", opts = {} },
      "neovim/nvim-lspconfig",
    },
  },
}
