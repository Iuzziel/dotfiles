require("user.set")
require("user.packer")
require("user.neogit")
-- require("user.debugger")

local augroup = vim.api.nvim_create_augroup
UserMeGroup = augroup('UserMe', {})

local autocmd = vim.api.nvim_create_autocmd
local yank_group = augroup('HighlightYank', {})

autocmd('TextYankPost', {
    group = yank_group,
    pattern = '*',
    callback = function()
        vim.highlight.on_yank({
            higroup = 'IncSearch',
            timeout = 40,
        })
    end,
})

-- autocmd({"BufEnter", "BufWinEnter", "TabEnter"}, {
--     group = UserGroup,
--     pattern = "*.rs",
--     callback = function()
--         require("lsp_extensions").inlay_hints{}
--     end
-- })

autocmd({"BufWritePre"}, {
    group = UserMeGroup,
    pattern = "*",
    command = "%s/\\s\\+$//e",
})


