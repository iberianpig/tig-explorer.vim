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

let s:before_exec_tig  = expand('<sfile>:p:h:h') . '/script/setup_tmp_tigrc.sh'
let s:tig_command      = 'TIGRC_USER=/tmp/.tigrc tig '

function! s:project_root_dir()
  let current_dir = expand('%:p:h')
  let relative_git_dir = finddir('.git', current_dir . ';') 
  let root_dir = fnamemodify(relative_git_dir, ':h')
  if !isdirectory(root_dir)
    return current_dir
  endif
  return root_dir
endfunction

function! s:open_file() abort
  if filereadable('/tmp/tig_explorer_current_file')
    exec system('cat /tmp/tig_explorer_current_file')
    call system('rm /tmp/tig_explorer_current_file')
  endif
  redraw!
endfunction

function! tig_explorer#call(str) abort
  if !executable('tig')
    echoerr 'You need to install tig.'
    return
  endif
  exec 'silent !' . s:before_exec_tig
  exec 'silent !' . s:tig_command . a:str
  :call s:open_file()
endfunction

function! tig_explorer#open(path)
  if !executable('tig')
    echoerr 'You need to install tig.'
    return
  endif
  exec 'silent !' . s:before_exec_tig
  exec 'silent !' . s:tig_command . a:path
  :call s:open_file()
endfunction

function! tig_explorer#open_current_file() abort
  let current_path = expand('%:p')
  :call tig_explorer#open(current_path)
endfunction

function! tig_explorer#open_project_root_dir() abort
  let root_dir = s:project_root_dir()
  :call tig_explorer#open(root_dir)
endfunction

function! tig_explorer#grep(str) abort
  if a:str == ""
    let word = shellescape(input("Pattern: "), 1)
  else
    " escape special character
    let word = shellescape(a:str, 1)
  endif
  if !executable('tig')
    echoerr 'You need to install tig.'
    return
  endif
  exec 'silent !' . s:before_exec_tig
  exec 'silent !' . s:tig_command . 'grep ' . word
  :call s:open_file()
endfunction

function! tig_explorer#blame() abort
  if !executable('tig')
    echoerr 'You need to install tig.'
    return
  endif
  exec 'silent !' . s:before_exec_tig
  exec 'silent !' . s:tig_command . 'blame +' . line('.') . ' ' . expand('%:p')
  :call s:open_file()
endfunction

let &cpo = s:save_cpo
unlet s:save_cpo
