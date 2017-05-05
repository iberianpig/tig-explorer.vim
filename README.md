# tig-explorer.vim

tig-explorer.vim open [tig](https://github.com/jonas/tig) from vim.

# Requirement

* tig(https://github.com/jonas/tig)

# installation

```vim
NeoBundle     'iberianpig/tig-explorer.vim'
```

## Usage

```vim
nnoremap <silent><Leader>t :TigOpenCurrentFile<CR>
nnoremap <silent><Leader>T :TigOpenProjectRootDir<CR>
```

# TODO
* `tig grep` command interface
