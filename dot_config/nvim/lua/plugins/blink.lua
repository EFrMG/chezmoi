return {
  'saghen/blink.cmp',
  opts = {
    keymap = {
      -- When Enter is pressed, fallback to the default Neovim behavior (insert a newline),
      -- effectively ignoring any completion suggestions.
      ['<CR>'] = { 'fallback' },

      -- When Tab is pressed, first try to accept a completion suggestion.
      -- If there's no active completion, try to jump to the next snippet placeholder.
      -- If neither action is applicable, insert a literal Tab character.
      ['<Tab>'] = { 'select_and_accept', 'snippet_forward', 'fallback' },
    },
    completion = {
      documentation = {
        auto_show = false,
      },
    },
    sources = {
      providers = {
        path = {
          score_offset = 3,
        },
        snippets = {
          score_offset = 2,
        },
        lsp = {
          score_offset = 1,
        },
      },
    },
  },
}
