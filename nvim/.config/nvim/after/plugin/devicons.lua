local Remap = require("user.keymap")
local nnoremap = Remap.nnoremap

-- nnoremap("<C-p>", ":Telescope")
nnoremap("<leader>ps", function()
    -- require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})
    require('telescope.builtin').grep_string()
end)
nnoremap("<C-p>", function()
    require('telescope.builtin').git_files()
end)
nnoremap("<Leader>pf", function()
    require('telescope.builtin').find_files()
end)

nnoremap("<leader>pw", function()
    require('telescope.builtin').grep_string { search = vim.fn.expand("<cword>") }
end)
nnoremap("<leader>pg", function()
    require('telescope.builtin').live_grep()
end)
nnoremap("<leader>pb", function()
    require('telescope.builtin').buffers()
end)
nnoremap("<leader>vh", function()
    require('telescope.builtin').help_tags()
end)
nnoremap("<leader>vrc", function()
    require('user.telescope').search_dotfiles({ hidden = true })
end)
-- nnoremap("<leader>va", function()
--     require('user.telescope').anime_selector()
-- end)
-- nnoremap("<leader>vc", function()
--     require('user.telescope').chat_selector()
-- end)
-- nnoremap("<leader>gc", function()
--     require('user.telescope').git_branches()
-- end)
-- nnoremap("<leader>gw", function()
--     require('telescope').extensions.git_worktree.git_worktrees()
-- end)
-- nnoremap("<leader>gm", function()
--     require('telescope').extensions.git_worktree.create_git_worktree()
-- end)
-- nnoremap("<leader>td", function()
--     require('user.telescope').dev()
-- end)

-- nnoremap("<leader>ff", "<cmd>Telescope find_files<cr>")
-- nnoremap("<leader>fg", "<cmd>Telescope live_grep<cr>")
-- nnoremap("<leader>fb", "<cmd>Telescope buffers<cr>")
-- nnoremap("<leader>fh", "<cmd>Telescope help_tags<cr>")
-- nnoremap("<leader>fr", "<cmd>Telescope registers<cr>")
-- nnoremap("<leader>fm", "<cmd>Telescope marks<cr>")

