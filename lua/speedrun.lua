local speedrun = {}

function speedrun.setup(conf)
    vim.api.nvim_create_autocmd('BufEnter', {
        callback = function(opts)
            local lang = vim.bo[opts.buf].filetype

            if conf.langs[lang]
            then
                local key = conf.keymap or '<leader>r'
                local icon = conf.langs[lang].icon or lang

                for i, item in ipairs(conf.langs[lang].cmd)
                do
                    vim.keymap.set('n', key .. (i == 1 and '' or i), 
                                   ':terminal ' .. (item or '') .. '\n', {
                        silent = true,
                        desc = 'Run ' .. icon .. ' (' .. i .. ')'
                    })
                end
            end
        end
    })
end

return speedrun
