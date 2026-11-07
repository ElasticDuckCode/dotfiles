-- [nfnl] fnl/plugins/telescope.fnl
local function _1_()
  local telescope = require("telescope")
  local builtin = require("telescope.builtin")
  local extensions = telescope.extensions
  telescope.setup({defaults = {initial_mode = "insert"}, pickers = {buffers = {theme = "dropdown", previewer = true}, find_files = {theme = "dropdown", previewer = true}, live_grep = {theme = "dropdown", previewer = true}, help_tags = {theme = "dropdown", previewer = true}, extensions = {}}})
  telescope.load_extension("fzf")
  local function _2_()
    return builtin.find_files()
  end
  vim.keymap.set("n", "<leader>sf", _2_, {})
  local function _3_()
    builtin.live_grep({cwd = vim.fn.getcwd()})
    return {}
  end
  vim.keymap.set("n", "<leader>sg", _3_)
  local function _4_()
    return builtin.find_files()
  end
  vim.keymap.set("n", "<leader>sf", _4_, {})
  local function _5_()
    return builtin.help_tags()
  end
  return vim.keymap.set("n", "<leader>sh", _5_, {})
end
return {"nvim-telescope/telescope.nvim", config = _1_, dependencies = {{"nvim-lua/plenary.nvim"}, {"nvim-telescope/telescope-fzf-native.nvim", build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release --target install"}}, enabled = true, tag = "v0.1.9"}
