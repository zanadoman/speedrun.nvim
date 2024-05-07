local speedrun = {}

function speedrun.setup(conf)
    vim.api.nvim_create_autocmd('BufEnter', {
        callback = function(opts)
            local lang = vim.bo[opts.buf].filetype

            if conf.langs and conf.langs[lang]
            then
                local key = conf.keymap
                local icon = conf.langs[lang].icon

                vim.keymap.set('n', key, ':terminal ' .. conf.langs[lang].cmd[1] .. '\n', {
                    silent = true,
                    desc = 'Run ' .. icon
                })

                for i, item in ipairs(conf.langs[lang].cmd)
                do
                    vim.keymap.set('n', key .. i, ':terminal ' .. item .. '\n', {
                        silent = true,
                        desc = 'Run ' .. icon .. ' (' .. i .. ')'
                    })
                end
            end
        end
    })
end

return speedrun
