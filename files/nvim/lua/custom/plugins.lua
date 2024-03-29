local plugins = {
	{
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "gofumpt",
        "goimports",
        "goimports-reviser",
        "golines",
        "gopls",
        "rust-analyzer",
        "golangci-lint",
        "golangci-lint-langserver",
      }
    }
	},
  {
    "nvim-tree/nvim-tree.lua",
    cmd = { "NvimTreeToggle", "NvimTreeFocus", "NvimTreeFindFile" },
    opts = {
      git = {
        -- enable = true,
      },
      update_focused_file = {
        -- update_root = true,
      },
      renderer = {
        root_folder_label = ":~:s?$?/..?",
      },
      on_attach = function(bufnr)
        local api = require "nvim-tree.api"

        local function opts(desc)
          return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
        end

        -- default mappings
        api.config.mappings.default_on_attach(bufnr)

        vim.keymap.del('n', '<C-k>', opts("Info"))
        vim.keymap.set('n', '?', api.tree.toggle_help, opts('Help'))
      end,
    },
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    ft = "go",
    opts = function()
      return require "custom.configs.null-ls"
    end,
  },
  {
    "rust-lang/rust.vim",
    ft = "rust",
    init = function ()
      vim.g.rustfmt_autosave = 1
    end
  },
  {
    "simrat39/rust-tools.nvim",
    ft = "rust",
    dependencies = "neovim/nvim-lspconfig",
    opts = function ()
      return require "custom.configs.rust-tools"
    end,
    config = function(_, opts)
      require('rust-tools').setup(opts)
    end
  },
  {
    "mfussenegger/nvim-dap",
  },
  {
    "saecki/crates.nvim",
    dependencies = "hrsh7th/nvim-cmp",
    ft = {"rust", "toml"},
    config = function(_, opts)
      local crates = require('crates')
      crates.setup(opts)
      crates.show()
    end,
  },
  {
    "hrsh7th/nvim-cmp",
    opts = function()
      local M = require "plugins.configs.cmp"
      table.insert(M.sources, {name = "crates"})
      return M
    end,
  },
  {
    "olexsmir/gopher.nvim",
    ft = "go",
    config = function(_, opts)
      require("gopher").setup(opts)
    end,
    build = function()
      vim.cmd [[silent! GoInstallDeps]]
    end,
  },
  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
    init = function ()
      vim.g.tmux_navigator_disable_when_zoomed = 1
    end
  },
  {
    "ziontee113/color-picker.nvim",
    ft = {"css", "conf"},
    config = function(_, opts)
      require("color-picker").setup({
        ["icons"] = { "ﱢ", "" },
        ["border"] = "rounded", -- none | single | double | rounded | solid | shadow
        ["keymap"] = { -- mapping example:
          ["U"] = "<Plug>ColorPickerSlider5Decrease",
          ["O"] = "<Plug>ColorPickerSlider5Increase",
        },
        ["background_highlight_group"] = "Normal", -- default
        ["border_highlight_group"] = "FloatBorder", -- default
        ["text_highlight_group"] = "Normal", --default
      })
    end,
  },
  {
    "NvChad/nvim-colorizer.lua",
    opts = {
      user_default_options = {
        names = false,
      },
    },
  },
  {
    "ruifm/gitlinker.nvim",
  },
  -- {
  --   "IndianBoy42/tree-sitter-just",
  --   ft = {"just"},
  --   lazy = false,
  --   init = function ()
  --     require('tree-sitter-just').setup({})
  --   end,
  --   config = function(_, opts)
  --     require('tree-sitter-just').setup(opts)
  --     require("nvim-treesitter.parsers").get_parser_configs().just = {
  --       install_info = {
  --         url = "https://github.com/IndianBoy42/tree-sitter-just", -- local path or git repo
  --         files = { "src/parser.c", "src/scanner.c" },
  --         branch = "main",
  --         compilers = {"gcc-11"}
  --         -- use_makefile = true -- this may be necessary on MacOS (try if you see compiler errors)
  --       },
  --       maintainers = { "@IndianBoy42" },
  --     }
  --   end,
  -- },
  {
    "noahtheduke/vim-just",
    ft = { "just" },
  },
  {
    "junegunn/vim-easy-align",
    lazy = false,
  },
}
return plugins
