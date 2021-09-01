
# Editors and Integrated Development Enviornments (IDEs)

There are many tools for editting code. The *right* one to use mostly comes
down to personal preference and what works for you. This is a quick list of 
editors that are known to "work" with some pros/cons.

Sometimes, IDEs get in the way by overcomplicating simple tasks (especially older ones).
Text editors can be a great choice for simple editting, or more complex editting in a few 
cases. 

## vim (text editor)

Pros:
- installed by default in most linux distributions
- very powerful and flexible
- can start with simple commands, and build up to complex commands over time
- syntax highlighting for code

Cons:
- still a bit of a learning curve
- text-based

Good for:
- general purpose text editting 
- code development

### Useful VIM features

Note VIM commands can often be added to other codes, e.g. Chrome, Jupyter, VSCcode!

Vim folding for selective viewing of code (see in particular folding based on indent, `fdm='indent'`).

`<ctrl-v>` for highlighting blocks. Combine with `Shift-I` for inserting columns e.g. commenting out.
`.` will repeat last command.

Splitting screen with `:vsplit` and `:split`. Use `<ctrl-W> + i,j,k,l` to move between them `<ctrl-W> + Shift + I,J,K,L` to move them.

`:e` to edit a different file, no argument will reload the current one.

`ctrl-l` will refresh the screen, sometimes is useful if something messed up.

`f` and `F` search forward and backward in the line. `;` will repeat it.

`%` will jump between a pair of brackets or parentheses.

`!command` will issue `command` on the command line.
`read !command` will do that and put the `STDOUT` into the file you're editing.

`q-<symbol>` begins recording all commands until you hit `q` again, and saves those commands as a macro. `@-<symbol>` to repeat the macro.

`m-<symbol>` will mark the spot in your code and `` `-<symbol>`` will move you back there. `` `+` `` will move to a previous position.

`<ctrl-n>` will autocomplete based on other words in the file.

All vim commands can be abbreviated, e.g. `:non` will do `:nonumber`. `:vs` will do `:vsplit`.

VIM is good for LaTeX! Just sepearate your commands and sentences by newlines and you can do sentence-by-sentence editing with line operations.


### Useful VIM addons

Use [vundle](https://github.com/VundleVim/Vundle.vim) to add packages to VIM. 
Useful vundle extensions that I use:
* [Syntastic](https://github.com/vim-syntastic/syntastic) (automatic syntax error detection). I have some notes on it [here](https://bbusemeyer.github.io/notes/syntastic/)
* [Julia syntax coloring](https://github.com/JuliaEditorSupport/julia-vim)

Ones that I've heard about (turns out a lot of these use neovim):
* [Indent guides](https://github.com/glepnir/indent-guides.nvim)
* [Code completion suggestions like VScode (https://github.com/onsails/lspkind-nvim)
* [VSCode(LSP)'s snippet feature in vim.](https://github.com/hrsh7th/vim-vsnip)
* [A tree like view for symbols](https://github.com/simrat39/symbols-outline.nvim)
* [File explorer](https://github.com/kyazdani42/nvim-tree.lua)
* [Search for words across files](https://github.com/nvim-telescope/telescope.nvim)
* [Automatic alignment](https://github.com/godlygeek/tabular)
* [Another autocompletion option](https://github.com/hrsh7th/nvim-cmp)
* [Autocomplete brackets](windwp/nvim-autopairs)

## emacs (text editor)

Pros:
- (similar to vim) very powerful and flexible
- can start with simple commands, and build up to complex commands over time
- extensible (only a pro if you use it)
- syntax highlighting for code

Cons:
- still a bit of a learning curve
- not installed by default, but readily available on Linux, MacOSX
- text-based

Good for:
- general purpose text editting 
- code development

Useul

## Sublime Text (text editor)

Pros:
- Many useful features
- GUI-based
- syntax highlighting for code

Cons:
- not "free", although it can be evaluated for free with no expiration date

Good for:
- general purpose text editting
- code development
- editting outside of a command line


## Visual Studio Code (text editor)

Pros:
- Cross-platform
- light-weight (for an IDE)
- free
- plugins available for essentially all major programming languages
- integrates directly with git
- clean, intuitive GUI

Cons:
- can require some setup

Good for:
- code development, especially larger projects
