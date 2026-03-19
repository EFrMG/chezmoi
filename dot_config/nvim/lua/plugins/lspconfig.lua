return {
  "neovim/nvim-lspconfig",
  opts = function(_, opts)
    opts.servers.lua_ls = opts.servers.lua_ls or {}
    opts.servers.lua_ls.settings = vim.tbl_deep_extend("force", opts.servers.lua_ls.settings or {}, {
      Lua = {
        workspace = {
          checkThirdParty = false,
          library = vim.api.nvim_get_runtime_file("", true),
        },
      },
    })

    return opts
  end,
}
