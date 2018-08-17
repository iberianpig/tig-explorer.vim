# tig-explorer.vim

Vim plugin to use [tig](https://github.com/jonas/tig) as a git client. Seamless switching between vim and tig with opening in the same buffer.
[![https://gyazo.com/181fef546cced7ca6dc651dff59cd1bf](https://i.gyazo.com/181fef546cced7ca6dc651dff59cd1bf.gif)](https://gyazo.com/181fef546cced7ca6dc651dff59cd1bf)

## Requirement

* tig(https://github.com/jonas/tig)

## Installation

```vim
NeoBundle     'iberianpig/tig-explorer.vim'
```

## Usage

### Available Command

#### Keymap on Tig

Following commands are available on tig launched from tig-explorer
```
e, <Ctrl-o>: edit on existing tab
<Ctrl-t>   : edit on new tab
<Ctrl-v>   : edit with vsplit window
<Ctrl-s>   : edit with split window
```


#### Keymap on Vim

Add following script to ~/.vimrc

```vim
" open tig with current file
nnoremap <Leader>t :TigOpenCurrentFile<CR>

" open tig with Project root path
nnoremap <Leader>T :TigOpenProjectRootDir<CR>

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
