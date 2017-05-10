"=============================================================================
" File:         ftdetect/rstrobot.vim
" Author:       Estevan Vedovelli
" Version:      0.0.1
"------------------------------------------------------------------------
" Description:
"   Filetype detection plugin for RST Robot files.
" WARNING:
"   Overrides all default file type checks.
"------------------------------------------------------------------------
" Installation:
"   - Requires Vim7+
"   - Drop this file into {rtp}/ftdetect
"   - Use the 'highlight:: robotframework' in the first lines of rst
"     file with robot tests.
"=============================================================================

" Try to discover if RST file has robot tests:
autocmd BufNewFile,BufRead *.rst call s:FTrobot()

func! s:FTrobot()
  let i = 1
  while i < 30
    if getline(i) =~# '\.\. highlight:: robotframework'
      set filetype=rstrobot
      return
    endif
    let i += 1
  endwhile
  while i < 500
    if getline(i) =~# '.. code:: robotframework'
      set filetype=rstrobot
      return
    endif
    let i += 1
  endwhile
endfunc

"------------------------------------------------------------------------
