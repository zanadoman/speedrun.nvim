# The problems
1. While writing your code you frequently open new terminal windows to run the 
same few codebase related commands.
2. While debugging, you constantly need to either open a new terminal windows, 
or use the built-in terminal. Both of those are slow compared to using a 
keybind.
3. Your compiler flags are getting too long to write over and over again.
4. You try a lot of different programming languages and you can't remember
how to compile or run your code in every language.
# The solutions
Specify multiply commands for keybinds for specific languages.
# Why speedrun.nvim?
Speedrun is a lightweight Neovim plugin written purely in Lua. It gives you the
ability to run any predefined command quickly inside your editor without 
any distractions.\
Speedrun uses the Neovim API, basically it does the same thing that you would
do in an external terminal, but in your editor with a keybind.\
Migration to speedrun.nvim is very easy and fast.\
Automatic descriptions for which-key.nvim
![speedrun.nvim](https://github.com/zanadoman/speedrun.nvim/blob/main/assets/whichkey1.png)
![speedrun.nvim](https://github.com/zanadoman/speedrun.nvim/blob/main/assets/whichkey2.png)
![speedrun.nvim](https://github.com/zanadoman/speedrun.nvim/blob/main/assets/speedrun.png)
# Installation
Install using your favorite plugin manager:
- Using lazy.nvim
```lua
{ 'zanadoman/speedrun.nvim' }
```
- Using vim-plug
```lua
Plug 'zanadoman/speedrun.nvim'
```
- Using packer.nvim
```lua
use {
    'zanadoman/speedrun.nvim',
}
```
# Configuration
Use keymap to set a global keybind for your commands (Note: this isn't the full
keybind you'll use, as you have to specify modifiers for every command.)
Inside langs, you can specify languages based on their filetypes (if you don't 
know them, just use ```vim :lua print(vim.bo.filetype)```)\
For every language, you can specify multiple commands and modifiers to run 
those commands. If you don't set the modifiers, it will default to the index
of the command in the table.\
You can also specify icons for your commands, and which-key.nvim will show 
them.\
Example configuration
```lua
require('speedrun').setup({
    keymap = '<leader>r',
    langs = {
        c = {
            cmd = {
                'gcc -std=c99 -O3 -Werror -Wall -Wextra -Wpedantic % && ./a.out',
                '../cbuild -l',
                '../cbuild -w',
                '../cbuild -g',
                'clang-format ../src/*.c ../inc/*.h'
            },
            mods = {'r', 'l', 'w', 'g', 'f'},
            icon = '󰙱'
        },
        cpp = {
            cmd = {
                'g++ -std=c++11 -O3 -Werror -Wall -Wextra -Wpedantic % && ./a.out',
                '../cbuild -l',
                '../cbuild -w',
                '../cbuild -g',
                'clang-format ../src/*.cpp ../inc/*.hpp'
            },
            mods = {'r', 'l', 'w', 'g', 'f'},
            icon = '󰙲'
        },
        rust = {
            cmd = {'cargo run', 'cargo clippy', 'cargo fmt', 'cargo test'},
            mods = {'r', 'c', 'f', 't'},
            icon = ''
        },
        cs = {
            cmd = {'dotnet run'}, 
            mods = {'r'},
            icon = '󰌛'
        },
        java = {
            cmd = {'java %'},
            mods = {'r'},
            icon = ''
        },
        python = {
            cmd = {'python3 %'},
            mods = {'r'},
            icon = ''
        },
        sh = {
            cmd = {'./%'},
            mods = {'r'},
            icon = ''
        },
        go = {
            cmd = {'go run .'},
            mods = {'r'},
            icon = '󰟓'
        },
        zig = {
            cmd = {'zig run .'},
            mods = {'r'},
            icon = ''
        }
    }
})
```
# Usage
Simply use the keybind you set for your current language and your command will 
run in a new terminal buffer. 
