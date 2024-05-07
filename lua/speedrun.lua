local speedrun = {}

function speedrun.setup(conf)
    vim.api.nvim_create_autocmd('BufEnter', {
        callback = function(opts)
            if conf.langs[vim.bo[opts.buf].filetype]
            then
                vim.keymap.set('n', conf.keymap, ':terminal ' ..
                conf.langs[vim.bo[opts.buf].filetype].cmd .. '\n', {
                    silent = true,
                    desc = 'Run ' .. (
                        conf.langs[vim.bo[opts.buf].filetype].icon
                        and conf.langs[vim.bo[opts.buf].filetype].icon
                        or vim.bo[opts.buf].filetype
                    )
                })
            end
        end
    })
end

return speedrun
