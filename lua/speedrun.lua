local speedrun = {}

function speedrun.setup(conf)
    vim.api.nvim_create_autocmd('BufEnter', {
        callback = function(opts)
            local lang = vim.bo[opts.buf].filetype

            if conf.langs[lang]
            then
                local key = conf.keymap or '<leader>r'
                local mode = conf.mode .. ' | :terminal ' or ':terminal '
                local cmd = conf.langs[lang].cmd or ''
                local icon = conf.langs[lang].icon or lang

                vim.keymap.set('n', conf.keymap, mode .. cmd .. '\n', {
                    silent = true,
                    desc = 'Run ' .. icon
                })
            end
        end
    })
end

return speedrun
