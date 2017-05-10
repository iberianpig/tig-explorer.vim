# tig-explorer.vim

tig-explorer.vim open [tig](https://github.com/jonas/tig) from vim.

## Requirement

* tig(https://github.com/jonas/tig)

## installation

```vim
NeoBundle     'iberianpig/tig-explorer.vim'
```

## Usage

```vim
nnoremap <Leader>t :TigOpenCurrentFile<CR>
nnoremap <Leader>T :TigOpenProjectRootDir<CR>
nnoremap <Leader>g :TigGrep<Space>
```
