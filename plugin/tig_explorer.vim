"=============================================================================
" File: tig_explorer.vim
" Author: iberianpig
" Created: 2017-04-03
"=============================================================================

scriptencoding utf-8

if exists('g:loaded_tig_explorer')
    finish
endif
let g:loaded_tig_explorer = 1

let s:save_cpo = &cpo
set cpo&vim

command! TigOpenCurrentFile
\    call tig_explorer#open_current_file()

command! TigOpenProjectRootDir
\    call tig_explorer#open_project_root_dir()

let &cpo = s:save_cpo
unlet s:save_cpo
