local speedrun = {}

function speedrun.setup(conf)
    vim.api.nvim_create_autocmd('BufEnter', {
        callback = function(opts)
            local lang = vim.bo[opts.buf].filetype

            if conf.langs and conf.langs[lang]
            then
                local key = conf.keymap
                local mods = conf.langs[lang].mods
                local icon = conf.langs[lang].icon or lang

                vim.keymap.set('n', key, ':terminal ' .. conf.langs[lang].cmd[1] .. '\n', {
                    silent = true,
                    desc = ' Run ' .. icon
                })

                for i, item in ipairs(conf.langs[lang].cmd)
                do
                    local mod = mods and (mods[i] or i - #mods) or i

                    vim.keymap.set('n', key .. mod, ':terminal ' .. item .. '\n', {
                        silent = true,
                        desc = ' ' .. icon .. ' (' .. item .. ')'
                    })
                end
            end
        end
    })
end

return speedrun
