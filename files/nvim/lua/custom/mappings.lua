local M = {}


M.general = {
  i = {
    ["jk"] = { "<ESC>", "escape insert mode" , opts = { nowait = true }},
  },

  n = {
    [";"] = { ":", opts = { noremap = true } },
    ["m"] = { ";", opts = { noremap = true } },
    ["M"] = { ",", opts = { noremap = true } },

    --nvim-tree
    ["<leader>f"] = { "<cmd> NvimTreeFindFile <CR>", "find current file in nvimtree", opts = { nowait = true} },

    -- tmux-navigator
    ["<C-h>"] = { "<cmd>TmuxNavigateLeft<cr>" },
    ["<C-j>"] = { "<cmd>TmuxNavigateDown<cr>" },
    ["<C-k>"] = { "<cmd>TmuxNavigateUp<cr>" },
    ["<C-l>"] = { "<cmd>TmuxNavigateRight<cr>" },

    --
    ["H"] = { "^", opts = { noremap = true } },
    ["L"] = { "$", opts = { noremap = true } },

    ["<CR>"] = { ":nohl<CR><CR>", "redraw screen to remove highlighting" , opts = { silent = true }},

    ["S"] = { "i<Enter><Esc>^", "Split line"},

    ["<leader>tt"] = {
      function ()
        require("base46").toggle_transparency()
      end,
      "toggle transparency"
    }
  },

  v = {
    --
    ["H"] = { "^", opts = { noremap = true } },
    ["L"] = { "$", opts = { noremap = true } },
  },
}

M.colorpicker = {
  n = {
    ["<leader>cp"] = { "<cmd>PickColor<cr>", opts = { noremap = true, silent = true } },
  },
  i = {
    ["<leader>cp"] = { "<cmd>PickColorInsert<cr>", opts = { noremap = true, silent = true } },
  }
}

M.other = {
  n = {
    ["<leader>cz"] = { "yy<cmd>lua require('Comment.api').toggle.linewise.current()<CR>p", opts = { noremap = true } },
  },

  v = {
    ["<leader>cz"] = { "Y`><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>p", opts = { noremap = true } },
  },
}

M.crates = {
  n = {
    ["<leader>rcu"] = {
      function ()
        require('crates').upgrade_all_crates()
      end,
      "update crates"
    }
  }
}

M.go = {
  i = {
    ["<leader>ge"] = { "<cmd>GoIfErr<CR><ESC>2jo" },
  },
  n = {
    ["<leader>ge"] = { "<cmd>GoIfErr<CR><ESC>2j" },
  }
}

return M
