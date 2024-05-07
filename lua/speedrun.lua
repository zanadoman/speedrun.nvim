local speedrun = {}

function speedrun.setup(conf)
    vim.api.nvim_create_autocmd('BufEnter', {
        callback = function(opts)
            local lang = vim.bo[opts.buf].filetype

            if conf.langs[lang]
            then
                for i, item in ipairs(conf.langs[lang].cmd)
                do
                    local key = conf.keymap or '<leader>r' .. i
                    local cmd = item or ''
                    local icon = conf.langs[lang].icon .. ' (' .. i .. ')' or lang

                    vim.keymap.set('n', conf.keymap, ':terminal' .. item .. '\n', {
                        silent = true,
                        desc = 'Run ' .. icon
                    })
                end
            end
        end
    })
end

return speedrun
