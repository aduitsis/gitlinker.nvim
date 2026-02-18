local M = {}

local git = require("gitlinker.git")

local defaults = {
  remote = "origin", -- force the use of a specific remote
  add_current_line_on_normal_mode = true, -- if true adds the line nr in the url for normal mode
  action_callback = require("gitlinker.actions").copy_to_clipboard, -- callback for what to do with the url
  print_url = true, -- print the url after action
  git_timeout = 5000, -- by default, any git command after 5 seconds.
}

local opts

function M.setup(user_opts)
  if not opts then
    opts = vim.tbl_deep_extend("force", {}, defaults)
  end
  opts = vim.tbl_deep_extend("force", opts, user_opts or {})
  if opts.git_timeout then
    git.git_timeout = opts.git_timeout
  end
end

function M.get()
  if not opts then
    opts = vim.tbl_deep_extend("force", {}, defaults)
  end
  return opts
end

return M
