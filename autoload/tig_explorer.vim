"=============================================================================
" File: tig_explorer.vim
" Author: iberianpig
" Created: 2017-04-03
"=============================================================================

scriptencoding utf-8

if !exists('g:loaded_tig_explorer')
  finish
endif
let g:loaded_tig_explorer = 1

let s:save_cpo = &cpo
set cpo&vim

let s:script_path = expand('<sfile>:p:h:h') . '/script/tig_vim.sh '

function! s:project_root_dir()
  let current_dir = expand('%:p:h')
  let relative_git_dir = finddir('.git', current_dir . ';') 
  let relative_root_dir = fnamemodify(relative_git_dir, ':h')
  let root_dir = current_dir . '/' . relative_root_dir
  if !isdirectory(root_dir)
    return current_dir
  endif
  return root_dir
endfunction

function! tig_explorer#open(path)
  if !executable('tig')
    echomsg 'You need install tig.'
    return
  endif
  exec 'silent !GIT_EDITOR=' . s:script_path . 'tig ' . a:path
  if filereadable('/tmp/vim_tig_current_file')
    exec 'edit ' . system('cat /tmp/vim_tig_current_file')
    call system('rm /tmp/vim_tig_current_file')
  endif
  redraw!
endfunction

function! tig_explorer#open_current_file() abort
  let current_path = expand('%:p')
  :call tig_explorer#open(current_path)
endfunction

function! tig_explorer#open_project_root_dir() abort
  let root_dir = s:project_root_dir()
  :call tig_explorer#open(root_dir)
endfunction

let &cpo = s:save_cpo
unlet s:save_cpo
