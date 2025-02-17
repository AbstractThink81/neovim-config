--
-- ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
-- ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
-- ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
-- ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
-- ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
-- ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝
--
-- File: plugins/init.lua
-- Description: init plugins config

-- Built-in plugins
local builtin_plugins = {
  { "nvim-lua/plenary.nvim" },
  -- File explore
  -- nvim-tree.lua - A file explorer tree for neovim written in lua
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
      opt = true
    },
    opts = function()
      require("plugins.configs.tree")
    end,
  },
  -- Formatter
  -- Lightweight yet powerful formatter plugin for Neovim
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = { lua = { "stylua" } },
    },
  },
  -- Git integration for buffers
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPost", "BufNewFile", "BufWritePost" },
    opts = function()
      require("plugins.configs.gitsigns")
    end,
  },
  -- Treesitter interface
  {
    "nvim-treesitter/nvim-treesitter",
    version = false, -- last release is way too old and doesn't work on Windows
    evevent = { "BufReadPost", "BufNewFile", "BufWritePost" },
    cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
    build = ":TSUpdate",
    opts = function()
      require("plugins.configs.treesitter")
    end,
  },
  -- Telescope
  -- Find, Filter, Preview, Pick. All lua, all the time.
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make"
      }
    },
    cmd = "Telescope",
    config = function(_)
      require("telescope").setup()
      -- To get fzf loaded and working with telescope, you need to call
      -- load_extension, somewhere after setup function:
      require("telescope").load_extension("fzf")
      require("plugins.configs.telescope")
    end
  },
  -- Statusline
  -- A blazing fast and easy to configure neovim statusline plugin written in pure lua.
  {
    "nvim-lualine/lualine.nvim",
    opts = function()
      require("plugins.configs.lualine")
    end
  },
  -- colorscheme
  -- {
  -- Rose-pine - Soho vibes for Neovim
  -- "rose-pine/neovim",
  -- name = "rose-pine",
  -- opts = {
  -- dark_variant = "main"
  -- }
  -- },
  {
    -- One Dark
    "navarasu/onedark.nvim",
    name = "onedark",
    opts = {
      style = "warm",
    },
<<<<<<< HEAD
  },
  -- LSP stuffs
  -- Portable package manager for Neovim that runs everywhere Neovim runs.
  -- Easily install and manage LSP servers, DAP servers, linters, and formatters.
  {
    "williamboman/mason.nvim",
    cmd = { "Mason", "MasonInstall", "MasonInstallAll", "MasonUninstall", "MasonUninstallAll", "MasonLog" },
    config = function()
      require("plugins.configs.mason")
    end
  },
  { "williamboman/mason-lspconfig.nvim" },
  {
    "nvimtools/none-ls.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = { "nvimtools/none-ls-extras.nvim" },
    lazy = false,
    config = function()
      require("plugins.configs.null-ls")
    end
  },
  {
    "neovim/nvim-lspconfig",
    event = "VimEnter",
    config = function()
      require("plugins.configs.lspconfig")
    end,
  },
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      {
        -- snippet plugin
        "L3MON4D3/LuaSnip",
        dependencies = "rafamadriz/friendly-snippets",
        opts = { history = true, updateevents = "TextChanged,TextChangedI" },
        config = function(_, opts)
          require("luasnip").config.set_config(opts)
          require("plugins.configs.luasnip")
=======
    -- Telescope
    -- Find, Filter, Preview, Pick. All lua, all the time.
    {
        "nvim-telescope/telescope.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-treesitter/nvim-treesitter",
            {
                "nvim-telescope/telescope-fzf-native.nvim",
                build = "make"
            }
        },
        cmd = "Telescope",
        config = function(_)
            require("telescope").setup()
            -- To get fzf loaded and working with telescope, you need to call
            -- load_extension, somewhere after setup function:
            require("telescope").load_extension("fzf")
            require("plugins.configs.telescope")
        end
    },
    -- Statusline
    -- A blazing fast and easy to configure neovim statusline plugin written in pure lua.
    {
        "nvim-lualine/lualine.nvim",
        opts = function()
            require("plugins.configs.lualine")
        end
    },
    -- colorscheme
    -- {
        -- Rose-pine - Soho vibes for Neovim
        -- "rose-pine/neovim",
        -- name = "rose-pine",
        -- opts = {
            -- dark_variant = "main"
        -- }
    -- },
    {
        -- One Dark
        "navarasu/onedark.nvim",
        name = "onedark",
        opts = {
          style = "warm",
        },
    },
    -- LSP stuffs
    -- Portable package manager for Neovim that runs everywhere Neovim runs.
    -- Easily install and manage LSP servers, DAP servers, linters, and formatters.
    {
        "williamboman/mason.nvim",
        cmd = { "Mason", "MasonInstall", "MasonInstallAll", "MasonUninstall", "MasonUninstallAll", "MasonLog" },
        config = function()
            require("plugins.configs.mason")
        end
    },
    { "williamboman/mason-lspconfig.nvim" },
    {
        "nvimtools/none-ls.nvim",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = { "nvimtools/none-ls-extras.nvim" },
        lazy = false,
        config = function()
            require("plugins.configs.null-ls")
        end
    },
    {
        "neovim/nvim-lspconfig",
        event = "VimEnter",
        config = function()
            require("plugins.configs.lspconfig")
        end,
    },
    {
        "hrsh7th/nvim-cmp",
        event = "InsertEnter",
        dependencies = {
            {
                -- snippet plugin
                "L3MON4D3/LuaSnip",
                dependencies = "rafamadriz/friendly-snippets",
                opts = { history = true, updateevents = "TextChanged,TextChangedI" },
                config = function(_, opts)
                    require("luasnip").config.set_config(opts)
                    require("plugins.configs.luasnip")
                end,
            },

            -- autopairing of (){}[] etc
            -- { "windwp/nvim-autopairs" },

            -- cmp sources plugins
            {
                "saadparwaiz1/cmp_luasnip",
                "hrsh7th/cmp-nvim-lua",
                "hrsh7th/cmp-nvim-lsp",
                "hrsh7th/cmp-buffer",
                "hrsh7th/cmp-path",
                "onsails/lspkind.nvim",
            },
        },
        opts = function()
            require("plugins.configs.cmp")
        end,
    },
    {
      "windwp/nvim-autopairs",
      config = function()
        require("nvim-autopairs").setup({
          ignored_next_char = '[%w%.%"]',
          disable_filetype = { "TelescopePrompt" },
        })
      end,
    },
    -- Colorizer
    {
        "norcalli/nvim-colorizer.lua",
        config = function(_)
            require("colorizer").setup()

            -- execute colorizer as soon as possible
            vim.defer_fn(function()
                require("colorizer").attach_to_buffer(0)
            end, 0)
        end
    },
    -- Keymappings
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        config = function()
            require("which-key").setup()
        end,
    },
    { "tpope/vim-unimpaired" },
    -- Copilot
    {
      "zbirenbaum/copilot-cmp",
      event = "InsertEnter",
      config = function () require("copilot_cmp").setup() end,
      dependencies = {
        "zbirenbaum/copilot.lua",
        cmd = "Copilot",
        config = function()
          require("copilot").setup({
            suggestion = { enabled = false },
            panel = { enabled = false },
          })
>>>>>>> 53f93fae4d72c4138a4b26e4529435b479ea714a
        end,
      },

      -- autopairing of (){}[] etc
      { "windwp/nvim-autopairs" },

      -- cmp sources plugins
      {
        "saadparwaiz1/cmp_luasnip",
        "hrsh7th/cmp-nvim-lua",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "onsails/lspkind.nvim",
      },
    },
    opts = function()
      require("plugins.configs.cmp")
    end,
  },
  -- Colorizer
  {
    "norcalli/nvim-colorizer.lua",
    config = function(_)
      require("colorizer").setup()

      -- execute colorizer as soon as possible
      vim.defer_fn(function()
        require("colorizer").attach_to_buffer(0)
      end, 0)
    end
  },
  -- Keymappings
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = function()
      require("which-key").setup()
    end,
  },
  { "tpope/vim-unimpaired" },
  -- Copilot
  {
    "github/copilot.nvim",
		lazy = false,
    -- cmd = "Copilot",
    -- config = function()
    --   require("copilot").setup({
    --     suggestion = { enabled = false },
    --     panel = { enabled = false },
    --   })
    -- end,
  },
    {
    "zbirenbaum/copilot-cmp",
    event = "InsertEnter",
    config = function() require("copilot_cmp").setup() end,
    dependencies = { "copilot" },
    {
      "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
      config = function()
        require("lsp_lines").setup()

        vim.diagnostic.config({ virtual_text = false, })
      end,
    },

  },
  -- Copilot chat
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    config = function()
      require("CopilotChat").setup()
    end,
    dependencies = {
      "copilot",
    },
    -- opts = {
    --
    -- },
  },
}

local exist, custom = pcall(require, "custom")
local custom_plugins = exist and type(custom) == "table" and custom.plugins or {}

-- Check if there is any custom plugins
-- local ok, custom_plugins = pcall(require, "plugins.custom")
require("lazy").setup({
  spec = { builtin_plugins, custom_plugins },
  lockfile = vim.fn.stdpath("config") .. "/lazy-lock.json", -- lockfile generated after running update.
  defaults = {
    lazy = false,                                           -- should plugins be lazy-loaded?
    version = nil
    -- version = "*", -- enable this to try installing the latest stable versions of plugins
  },
  ui = {
    icons = {
      ft = "",
      lazy = "󰂠",
      loaded = "",
      not_loaded = ""
    }
  },
  install = {
    -- install missing plugins on startup
    missing = true,
    -- try to load one of these colorschemes when starting an installation during startup
    colorscheme = { "habamax" }
  },
  checker = {
    -- automatically check for plugin updates
    enabled = true,
    -- get a notification when new updates are found
    -- disable it as it's too annoying
    notify = false,
    -- check for updates every day
    frequency = 86400
  },
  change_detection = {
    -- automatically check for config file changes and reload the ui
    enabled = true,
    -- get a notification when changes are found
    -- disable it as it's too annoying
    notify = false
  },
  performance = {
    cache = {
      enabled = true
    }
  },
  state = vim.fn.stdpath("state") .. "/lazy/state.json" -- state info for checker and other things
})
