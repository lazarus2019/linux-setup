return {
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    opts = {
      default_mappings = false, -- setting this to false removes all the default mappings
      mappings = {
        i = {
          -- map kj and kk to exit insert mode
          k = {
            j = "<Esc>",
            k = "<Esc>",
          },
          -- map jk and jj  to exit insert mode
          j = {
            k = "<Esc>",
            j = "<Esc>",
          },
        },
      },
    },
  },
}
