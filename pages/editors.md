
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

Command mode vs. edit mode. 
Command mode with `escape` or `ctrl-c`. When there exit via `:q` use `:q!` to force it. `:w` to save, etc.
`i` or `a` will enter edit mode.

`o` vs `O` to make a new line at the current indent level.

`:set paste` to paste blocks of code. `:set nopaste` after. It avoid VIM adding indents to blocks of codes.

Vim folding for selective viewing of code (see in particular folding based on indent, `fdm='indent'`).

`<ctrl-v>` for highlighting blocks. Combine with `Shift-I` for inserting columns e.g. commenting out.
`.` will repeat last command.

Highlight code and do `!command` to feed that code into a bash script as input. Try `<ctrl-v>!column -t` to align.

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

`<number>-y` to copy a number of lines. If you're limited by buffer size `:e <new-file>` will be able to paste.

`:<line number>` to jump to a line. `G` to go to the end.

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
- people that are very comfortable using regular expressions

Useful commands:

Due to the complexitly of emacs, here, we assume some familiarity with the basics ( check out this [Emacs tutorial](https://www.gnu.org/software/emacs/tour/) ).

a rule of thumb is that most 'commands' will involve `ctrl-<key>` (hold ctrl while typing <key>, then release both), and
  then various macros and addons usually use `meta-<key>` and usually some more input, where the `meta` key is usually the left alt key. 
  `Ecp` can be used as a stand in for meta, but should *not* be held down `Esc <key>` = `meta-<key>`.

run `$ emacs -nw file_to_edit` to run emacs in the terminal (without '-nw', emacs will try to open it's own window)

`ctrl-x ctrl-s` saves the current buffer(file)

`ctrl-x ctrl-c` close emacs (will prompt you to save files, etc. in the 'minibuffer' at the bottom of the screen)

`ctrl-x u` undo changes

`ctrl-z` sends emacs to the background - resume with `$ %emacs` assuming emacs is the only 'job' running in the background

`ctrl-g` and `Esc Esc`, can be used to cancel partially entered commands.

`ctrl-space` is set marker

Set marker(`ctrl-space`), then `ctrl-w` will *cut* the selected text.

Set marker(`ctrl-space`), then `meta-w`(usually `left alt-w`) will *copy* the selected text.

`ctrl-y` will yank(paste) at the current cursor position

`ctrl-x ctrl-f` file_name will open 'file_name' in current active buffer

opening multiple buffers:

`ctrl-x 2` splits current buffer in to two buffers with a horizontal split

`ctrl-x 3` splits current buffer in to two buffers with a vertical split

`ctrl-x o` cycle between the 'split' buffers

`ctrl-x 1` closes all 'split' buffers except the active one

`meta-x shell` opens a shell (sometimes in new 'split' buffer, sometimes in current buffer depending on the configuration)

Working with "Rectangles" which are a rectangular segment (in terms of rows and columns) of a file.
To define a rectangle, place a marker in one of the corners:
  - navigate to any corner of the rectangle (you can use the arrow keys to navigate)
  - type `ctrl-space' to set a marker at that corner
  - navigate to the opposite (diagonally) corner
  - use any of the following 'rectangle' commands
      - kill rectangle `C-x r k`
      - yank rectangle `C-x r y`
      - open rectangle, shifting text right C-x r o
      - blank out rectangle C-x r c
      - prefix each line with a string C-x r t

Can split between a shell and a editing screen.

Will auto-save things.

GNU.org's [cheat sheet](https://www.gnu.org/software/emacs/refcards/pdf/refcard.pdf)

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

Remote SSH extension to mount remote directories. 
Reads your ssh config file, that helps a lot.

Can put in vim commands with an extension.

Loads of nice features built-in that you'd have to find an extension for vim.

Some nice features from James:
* [VSCode Remote-SSH](https://code.visualstudio.com/docs/remote/ssh)
*  [Setting up VSCode Remote](https://jamesetsmith.github.io/Editing-Files-on-Remote-Server-From-a-Local-VSCode/) (a bit redundant with the docs above, but might be helpful)

