function speedrun.setup(opts)
    vim.api.nvim_create_autocmd('BufEnter', {
        callback = function(opts)
            if opts.langs[vim.bo[opts.buf].filetype]
            then
                vim.keymap.set('n', opts.keymap, ':terminal ' ..
                opts.langs[vim.bo[opts.buf].filetype].cmd .. '\n', {
                    silent = true,
                    desc = 'Run ' .. (
                        opts.langs[vim.bo[opts.buf].filetype].icon
                        and opts.langs[vim.bo[opts.buf].filetype].icon
                        or vim.bo[opts.buf].filetype
                    )
                })
            end
        end
    })
end
