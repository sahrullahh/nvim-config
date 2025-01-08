-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

require("presence").setup({
  -- General options
  auto_update = true, -- Update activity based on autocmd events (if `false`, map or manually execute `:lua package.loaded.presence:update()`)
  neovim_image_text = "The One True Text Editor", -- Text displayed when hovered over the Neovim image
  main_image = "neovim", -- Main image display (either "neovim" or "file")
  client_id = "793271441293967371", -- Use your own Discord application client id (not recommended)
  log_level = nil, -- Log messages at or above this level (one of the following: "debug", "info", "warn", "error")
  debounce_timeout = 10, -- Number of seconds to debounce events (or calls to `:lua package.loaded.presence:update(<filename>, true)`)
  enable_line_number = false, -- Displays the current line number instead of the current project
  blacklist = {}, -- A list of strings or Lua patterns that disable Rich Presence if the current file name, path, or workspace matches
  buttons = true, -- Configure Rich Presence button(s), either a boolean to enable/disable, a static table (`{{ label = "<label>", url = "<url>" }, ...}`, or a function(buffer: string, repo_url: string|nil): table)
  file_assets = {}, -- Custom file asset definitions keyed by file names and extensions (see default config at `lua/presence/file_assets.lua` for reference)
  show_time = true, -- Show the timer

  -- Rich Presence text options
  editing_text = "Editing %s", -- Format string rendered when an editable file is loaded in the buffer (either string or function(filename: string): string)
  file_explorer_text = "Browsing %s", -- Format string rendered when browsing a file explorer (either string or function(file_explorer_name: string): string)
  git_commit_text = "Committing changes", -- Format string rendered when committing changes in git (either string or function(filename: string): string)
  plugin_manager_text = "Managing plugins", -- Format string rendered when managing plugins (either string or function(plugin_manager_name: string): string)
  reading_text = "Reading %s", -- Format string rendered when a read-only or unmodifiable file is loaded in the buffer (either string or function(filename: string): string)
  workspace_text = "Working on %s", -- Format string rendered when in a git repository (either string or function(project_name: string|nil, filename: string): string)
  line_number_text = "Line %s out of %s", -- Format string rendered when `enable_line_number` is set to true (either string or function(line_number: number, line_count: number): string)
})

-- ScreenKey Plugins

require("screenkey").setup({
  win_opts = {
    row = vim.o.lines - vim.o.cmdheight - 1,
    col = vim.o.columns - 1,
    relative = "editor",
    anchor = "SE",
    width = 20,
    height = 3,
    border = "single",
    title = "Now I click",
    title_pos = "left",
    style = "minimal",
    focusable = false,
    noautocmd = true,
  },
  compress_after = 3,
  clear_after = 3,
  disable = {
    filetypes = {},
    buftypes = {},
    events = false,
  },
  show_leader = true,
  group_mappings = false,
  display_infront = {},
  display_behind = {},
  filter = function(keys)
    return keys
  end,
  keys = {
    ["<TAB>"] = "󰌒",
    ["<CR>"] = "󰌑",
    ["<ESC>"] = "Esc",
    ["<SPACE>"] = "␣",
    ["<BS>"] = "󰌥",
    ["<DEL>"] = "Del",
    ["<LEFT>"] = "",
    ["<RIGHT>"] = "",
    ["<UP>"] = "",
    ["<DOWN>"] = "",
    ["<HOME>"] = "Home",
    ["<END>"] = "End",
    ["<PAGEUP>"] = "PgUp",
    ["<PAGEDOWN>"] = "PgDn",
    ["<INSERT>"] = "Ins",
    ["<F1>"] = "󱊫",
    ["<F2>"] = "󱊬",
    ["<F3>"] = "󱊭",
    ["<F4>"] = "󱊮",
    ["<F5>"] = "󱊯",
    ["<F6>"] = "󱊰",
    ["<F7>"] = "󱊱",
    ["<F8>"] = "󱊲",
    ["<F9>"] = "󱊳",
    ["<F10>"] = "󱊴",
    ["<F11>"] = "󱊵",
    ["<F12>"] = "󱊶",
    ["CTRL"] = "Ctrl",
    ["ALT"] = "Alt",
    ["SUPER"] = "󰘳",
    ["<leader>"] = "<leader>",
  },
})

require("neoscroll").setup({
  mappings = { -- Keys to be mapped to their corresponding default scrolling animation
    "<C-u>",
    "<C-d>",
    "<C-b>",
    "<C-f>",
    "<C-y>",
    "<C-e>",
    "zt",
    "zz",
    "zb",
  },
  hide_cursor = true, -- Hide cursor while scrolling
  stop_eof = true, -- Stop at <EOF> when scrolling downwards
  respect_scrolloff = false, -- Stop scrolling when the cursor reaches the scrolloff margin of the fil
  easing = "linear", -- Default easing function
  pre_hook = nil, -- Function to run before the scrolling animation starts
  post_hook = nil, -- Function to run after the scrolling animation ends
  performance_mode = false, -- Disable "Performance Mode" on all buffers.
  ignored_events = { -- Events ignored while scrolling
    "WinScrolled",
    "CursorMoved",
  },
})
