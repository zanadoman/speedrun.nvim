local speedrun = {}

function speedrun.setup(conf)
    vim.api.nvim_create_autocmd('BufEnter', {
        callback = function(opts)
            local lang = vim.bo[opts.buf].filetype

            if conf.langs[lang]
            then
                for i, item in ipairs(conf.langs[lang].cmd)
                do
                    local key = conf.keymap .. i or '<leader>r' .. i
                    local cmd = item or ''
                    local icon = conf.langs[lang].icon or lang

                    vim.keymap.set('n', key, ':terminal ' .. item .. '\n', {
                        silent = true,
                        desc = 'Run ' .. icon .. ' (' .. i .. ')'
                    })
                end
            end
        end
    })
end

return speedrun
