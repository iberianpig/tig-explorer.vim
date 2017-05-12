# tig-explorer.vim

tig-explorer.vim open [tig](https://github.com/jonas/tig) from vim.

## Requirement

* tig(https://github.com/jonas/tig)

## Installation

```vim
NeoBundle     'iberianpig/tig-explorer.vim'
```

## Usage

```vim
" open tig with current file
nnoremap <Leader>t :TigOpenCurrentFile<CR>

" open tig with Project root path
nnoremap <Leader>T :TigOpenProjectRootDir<CR>

" open tig grep
nnoremap <Leader>g :TigGrep<CR>

" open tig grep with the selected word
vnoremap <Leader>g y:TigGrep<Space><C-R>"<CR>

" open tig grep with the word under the cursor
nnoremap <Leader>cg :<C-u>:TigGrep<Space><C-R><C-W><CR>
```
