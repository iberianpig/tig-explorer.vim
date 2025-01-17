# tig-explorer.vim

Vim plugin to use [Tig](https://github.com/jonas/tig) as a git client.
* Seamless switching between Vim and Tig
* Adding buffer in the same process, not a child of Tig process.
* Open files in tabs or vertically / horizontal split windows on Vim from Tig
* Dynamically defining keymaps on Tig
* Support Vim8 / NeoVim terminal
* Open diff-mode side by side at the selected commit from Tig

[![https://gyazo.com/181fef546cced7ca6dc651dff59cd1bf](https://i.gyazo.com/181fef546cced7ca6dc651dff59cd1bf.gif)](https://gyazo.com/181fef546cced7ca6dc651dff59cd1bf)

## Requirement

* tig(https://github.com/jonas/tig)

## Installation

```vim
" vim-plug
Plug 'iberianpig/tig-explorer.vim'

" NeoBundle
NeoBundle 'iberianpig/tig-explorer.vim'
```

**NOTE: If you use Neovim, you have to add the dependency to the plugin bclose.vim:**

```vim
" vim-plug
Plug 'rbgrouleff/bclose.vim'

" NeoBundle
NeoBundle 'rbgrouleff/bclose.vim'
```


## Usage

### Keymap on Tig

Following commands are available on Tig launched from tig-explorer.
```
e, <Ctrl-o>: edit on existing tab
<Ctrl-t>   : edit on new tab
<Ctrl-v>   : edit with vsplit window
<Ctrl-s>   : edit with split window

<ESC> o: open with commit on existing tab
<ESC> t: open with commit on new tab
<ESC> v: open with commit with vsplit window
<ESC> s: open with commit with split window
```

Keymaps are available in the main, blame, tree, and refs views.
When opened with the commit, it opens in read-only mode.
When opening with commit with split or vsplit, it will open with diffsplit.

#### Customize Keymap on Tig

tig-explorer.vim defines the following keymap by default

```vim
let g:tig_explorer_keymap_edit_e  = 'e'
let g:tig_explorer_keymap_edit    = '<C-o>'
let g:tig_explorer_keymap_tabedit = '<C-t>'
let g:tig_explorer_keymap_split   = '<C-s>'
let g:tig_explorer_keymap_vsplit  = '<C-v>'

let g:tig_explorer_keymap_commit_edit    = '<ESC>o'
let g:tig_explorer_keymap_commit_tabedit = '<ESC>t'
let g:tig_explorer_keymap_commit_split   = '<ESC>s'
let g:tig_explorer_keymap_commit_vsplit  = '<ESC>v'
```

### Keymap on Vim

Add following script to ~/.vimrc

```vim
" open tig with current file
nnoremap <Leader>T :TigOpenCurrentFile<CR>

" open tig with Project root path
nnoremap <Leader>t :TigOpenProjectRootDir<CR>

" open tig grep
nnoremap <Leader>g :TigGrep<CR>

" resume from last grep
nnoremap <Leader>r :TigGrepResume<CR>

" open tig grep with the selected word
vnoremap <Leader>g y:TigGrep<Space><C-R>"<CR>

" open tig grep with the word under the cursor
nnoremap <Leader>cg :<C-u>:TigGrep<Space><C-R><C-W><CR>

" open tig blame with current file
nnoremap <Leader>b :TigBlame<CR>
```

### Other options

By default, tig-explorer will use the built-in terminal if available.
To force launching tig-explorer as a shell command, you can add the following to
~/.vimrc

```vim
" don't use builtin terminal
let g:tig_explorer_use_builtin_term=0
```

On Gvim, it is available only built-in terminal. 
