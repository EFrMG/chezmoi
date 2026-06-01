return {
  "folke/snacks.nvim",
  opts = {
    picker = {
      -- hidden = true,
      sources = {
        files = {
          hidden = true,
        },
        explorer = {
          hidden = true,
          ignored = true,
        }
      }
    },
    lazygit = {
      theme = {
        [241]                      = { fg = "Special" },
        activeBorderColor          = { fg = "Function", bold = true },
        cherryPickedCommitBgColor  = { fg = "Identifier" },
        cherryPickedCommitFgColor  = { fg = "Function" },
        defaultFgColor             = { fg = "Normal" },
        inactiveBorderColor        = { fg = "FloatBorder" },
        optionsTextColor           = { fg = "Function" },
        searchingActiveBorderColor = { fg = "MatchParen", bold = true },
        selectedLineBgColor        = { bg = "Visual" }, -- set to `default` to have no background colour
        unstagedChangesColor       = { fg = "DiagnosticError" },
      },
    },
  }
}
